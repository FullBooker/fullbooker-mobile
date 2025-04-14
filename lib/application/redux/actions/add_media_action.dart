import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/actions/upload_media_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/host_state.dart';
import 'package:fullbooker/domain/core/entities/product_image.dart';
import 'package:file_picker/file_picker.dart';

class AddProductMediaAction extends ReduxAction<AppState> {
  final List<PlatformFile> pickedFiles;

  AddProductMediaAction(this.pickedFiles);

  @override
  Future<AppState?> reduce() async {
    final List<ProductImage> mediaList = <ProductImage>[
      ...(state.hostState?.productMediaState?.media ?? <ProductImage>[]),
    ];

    for (final PlatformFile file in pickedFiles) {
      final ProductImage tempImage = ProductImage();
      mediaList.add(tempImage);

      dispatch(
        UploadProductMediaAction(
          file: File(file.path!),
          placeholder: tempImage,
        ),
      );
    }

    final HostState? updatedHost = state.hostState?.copyWith(
      productMediaState:
          state.hostState?.productMediaState?.copyWith(media: mediaList),
    );

    return state.copyWith(hostState: updatedHost);
  }
}
