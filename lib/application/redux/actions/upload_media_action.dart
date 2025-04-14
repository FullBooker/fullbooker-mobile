import 'dart:convert';
import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/host_state.dart';
import 'package:fullbooker/domain/core/entities/product_image.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class UploadProductMediaAction extends ReduxAction<AppState> {
  final File file;
  final ProductImage placeholder;

  UploadProductMediaAction({required this.file, required this.placeholder});

  @override
  Future<AppState?> reduce() async {
    final String endpoint = GetIt.I.get<AppConfig>().productMediaEndpoint;

    final Uri uri = Uri.parse(endpoint);
    final MultipartRequest request = MultipartRequest('POST', uri)
      ..files.add(await MultipartFile.fromPath('file', file.path));

    final StreamedResponse response = await request.send();
    final String resBody = await response.stream.bytesToString();

    final List<ProductImage> mediaList = <ProductImage>[
      ...(state.hostState?.productMediaState?.media ?? <ProductImage>[]),
    ];

    if (response.statusCode == 200) {
      final ProductImage newImage = ProductImage.fromJson(jsonDecode(resBody));
      final List<ProductImage> updated = mediaList
          .map((ProductImage p) => p == placeholder ? newImage : p)
          .toList();

      final HostState? updatedHost = state.hostState?.copyWith(
        productMediaState:
            state.hostState?.productMediaState?.copyWith(media: updated),
      );

      return state.copyWith(hostState: updatedHost);
    }

    final List<ProductImage> fallback = mediaList..remove(placeholder);
    final HostState? updatedHost = state.hostState?.copyWith(
      productMediaState:
          state.hostState?.productMediaState?.copyWith(media: fallback),
    );

    return state.copyWith(hostState: updatedHost);
  }
}
