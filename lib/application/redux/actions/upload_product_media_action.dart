import 'dart:convert';
import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/host_state.dart';
import 'package:fullbooker/domain/core/entities/product_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class UploadProductMediaAction extends ReduxAction<AppState> {
  final List<PlatformFile> pickedFiles;
  final ICustomClient client;

  UploadProductMediaAction({
    required this.pickedFiles,
    required this.client,
  });

  @override
  Future<AppState?> reduce() async {
    final List<ProductImage> existingMedia =
        state.hostState?.productMediaState?.media ?? <ProductImage>[];

    final String endpoint = GetIt.I.get<AppConfig>().productMediaEndpoint;

    final List<File> imageFiles = pickedFiles
        .where((PlatformFile p) => p.path != null)
        .map((PlatformFile p) => File(p.path!))
        .toList();

    final Response response = await client.uploadMedia(
      endpoint: endpoint,
      data: <String, String>{},
      images: imageFiles,
    );

    final List<dynamic> decoded = jsonDecode(response.body);

    // Convert to ProductImage instances
    final List<ProductImage> uploadedImages =
        decoded.map((dynamic json) => ProductImage.fromJson(json)).toList();

    final HostState? updatedHost = state.hostState?.copyWith(
      productMediaState: state.hostState?.productMediaState?.copyWith(
        media: <ProductImage>[
          ...existingMedia,
          ...uploadedImages,
        ],
      ),
    );

    return state.copyWith(hostState: updatedHost);
  }
}
