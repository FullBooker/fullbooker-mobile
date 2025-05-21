import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/custom_video_thumbnail_image.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';

/// Widget for building video attachment thumbnail.
class CustomVideoThumbnail extends StatelessWidget {
  const CustomVideoThumbnail({
    super.key,
    required this.videoUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  final BoxFit fit;
  final double? height;
  final String? videoUrl;
  final double? width;

  @override
  Widget build(BuildContext context) {
    if (videoUrl == null) {
      return Image.asset(
        productImageZeroState,
        height: MediaQuery.of(context).size.height * .2,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }

    return Image(
      image: CustomVideoThumbnailImage(videoUrl: videoUrl!),
      width: width,
      height: height,
      fit: fit,
      frameBuilder: (
        BuildContext context,
        Widget child,
        int? frame,
        bool wasSynchronouslyLoaded,
      ) {
        if (frame != null || wasSynchronouslyLoaded) {
          return child;
        }

        return AppLoading();
      },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return Image.asset(
          productImageZeroState,
          height: MediaQuery.of(context).size.height * .2,
          width: double.infinity,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
