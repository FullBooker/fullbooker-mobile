import 'dart:convert';
import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class UploadProductPhotosAction extends ReduxAction<AppState> {
  UploadProductPhotosAction({
    required this.pickedPhotoFiles,
    required this.client,
    this.onSuccess,
    this.onError,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;
  final List<PlatformFile> pickedPhotoFiles;

  @override
  Future<AppState?> reduce() async {
    final List<ProductMedia?> existingPhotos =
        state.hostState?.currentProduct?.photos ?? <ProductMedia?>[];

    final String productID = state.hostState?.currentProduct?.id ?? UNKNOWN;

    final Map<String, String> data = <String, String>{
      'product_id': productID,
      'media_type': kImageMediaType,
    };

    final String endpoint = GetIt.I.get<AppConfig>().productMediaEndpoint;

    final List<File> imageFiles = pickedPhotoFiles
        .where((PlatformFile p) => p.path != null)
        .map((PlatformFile p) => File(p.path!))
        .toList();

    if (imageFiles.isEmpty) {
      onError?.call(invalidMediaFilesError);
      return null;
    }

    final List<Response> responses = await client.uploadMedia(
      endpoint: endpoint,
      data: data,
      files: imageFiles,
    );

    final List<ProductMedia> uploadedPhotos = <ProductMedia>[];

    for (final Response httpResponse in responses) {
      final Map<String, dynamic> body =
          json.decode(httpResponse.body) as Map<String, dynamic>;

      if (httpResponse.statusCode >= 400) {
        final String? error = client.parseError(body);
        onError?.call(error ?? defaultUserFriendlyMessage);
        return null;
      }

      uploadedPhotos.add(ProductMedia.fromJson(body));
    }

    dispatch(
      UpdateProductAction(
        photos: <ProductMedia?>[...existingPhotos, ...uploadedPhotos],
      ),
    );

    onSuccess?.call();
    return null;
  }
}
