import 'package:flutter/services.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:get_thumbnail_video/index.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';

class VideoService {
  static Future<Uint8List> getVideoThumbnail({
    required String url,
    ImageFormat imageFormat = ImageFormat.PNG,
    int maxHeight = 0,
    int maxWidth = 0,
    int timeMs = 0,
    int quality = 10,
  }) async {
    try {
      return await VideoThumbnail.thumbnailData(
        video: url,
        imageFormat: imageFormat,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        timeMs: timeMs,
        quality: quality,
      );
    } catch (e) {
      return generatePlaceholderThumbnail();
    }
  }
}

/// Generates a placeholder thumbnail by loading placeholder.png from assets.
Future<Uint8List> generatePlaceholderThumbnail() async {
  final ByteData placeholder = await rootBundle.load(productImageZeroState);

  return placeholder.buffer.asUint8List();
}
