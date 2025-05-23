import 'dart:convert';
import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/host_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class UploadProductVideosAction extends ReduxAction<AppState> {
  UploadProductVideosAction({
    required this.pickedVideoFiles,
    required this.client,
    this.onSuccess,
    this.onError,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;
  final List<PlatformFile> pickedVideoFiles;

  @override
  Future<AppState?> reduce() async {
    final HostState? hostState = state.hostState;
    final WorkflowState workflowState =
        hostState?.workflowState ?? WorkflowState.CREATE;

    final bool isEdit = workflowState == WorkflowState.VIEW;

    final List<ProductMedia?> existingVideos = List<ProductMedia?>.from(
      isEdit
          ? hostState?.selectedProduct?.videos ?? <ProductMedia>[]
          : hostState?.currentProduct?.videos ?? <ProductMedia>[],
    );

    final String? productID =
        isEdit ? hostState?.selectedProduct?.id : hostState?.currentProduct?.id;

    final Map<String, String> data = <String, String>{
      'product_id': productID ?? UNKNOWN,
      'media_type': kVideoMediaType,
    };

    final String endpoint = GetIt.I.get<AppConfig>().productMediaEndpoint;

    final List<File> videoFiles = pickedVideoFiles
        .where((PlatformFile p) => p.path != null)
        .map((PlatformFile p) => File(p.path!))
        .toList();

    if (videoFiles.isEmpty) {
      onError?.call(invalidMediaFilesError);
      return null;
    }

    final List<Response> responses = await client.uploadMedia(
      endpoint: endpoint,
      data: data,
      files: videoFiles,
    );

    final List<ProductMedia> uploadedVideos = <ProductMedia>[];

    for (final Response httpResponse in responses) {
      final Map<String, dynamic> body =
          json.decode(httpResponse.body) as Map<String, dynamic>;

      if (httpResponse.statusCode >= 400) {
        final String? error = client.parseError(body);
        onError?.call(error ?? defaultUserFriendlyMessage);
        return null;
      }

      uploadedVideos.add(ProductMedia.fromJson(body));
    }

    dispatch(
      UpdateProductAction(
        videos: <ProductMedia?>[...existingVideos, ...uploadedVideos],
      ),
    );

    onSuccess?.call();

    return null;
  }
}
