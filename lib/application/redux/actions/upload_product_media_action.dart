import 'dart:convert';
import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class UploadProductMediaAction extends ReduxAction<AppState> {
  final List<PlatformFile> pickedFiles;
  final ICustomClient client;
  final Function(String error)? onError;
  final Function()? onSuccess;

  UploadProductMediaAction({
    required this.pickedFiles,
    required this.client,
    this.onSuccess,
    this.onError,
  });

  @override
  Future<AppState?> reduce() async {
    // final List<ProductImage> existingMedia =
    //     state.hostState?.productMediaState?.media ?? <ProductImage>[];

    final String productID = state.hostState?.currentProduct?.id ?? UNKNOWN;

    final Map<String, String> data = <String, String>{
      'product': productID,
      'media_type ': 'image',
    };

    final String endpoint = GetIt.I.get<AppConfig>().productMediaEndpoint;

    final List<File> imageFiles = pickedFiles
        .where((PlatformFile p) => p.path != null)
        .map((PlatformFile p) => File(p.path!))
        .toList();

    final Response httpResponse = await client.uploadMedia(
      endpoint: endpoint,
      data: data,
      images: imageFiles,
    );

    final Map<String, dynamic> body =
        json.decode(httpResponse.body) as Map<String, dynamic>;

    if (httpResponse.statusCode >= 400) {
      final String? error = client.parseError(body);

      return onError?.call(error ?? defaultUserFriendlyMessage);
    }

    // final List<ProductImage> uploadedImages =
    //     body.map((dynamic json) => ProductImage.fromJson(json)).toList();

    // final HostState? updatedHost = state.hostState?.copyWith(
    //   productMediaState: state.hostState?.productMediaState?.copyWith(
    //     media: <ProductImage>[
    //       ...existingMedia,
    //       ...uploadedImages,
    //     ],
    //   ),
    // );

    // return state.copyWith(hostState: updatedHost);
    return state;
  }
}
