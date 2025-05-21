import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/video_service.dart';
import 'package:get_thumbnail_video/index.dart';

class CustomVideoThumbnailImage
    extends ImageProvider<CustomVideoThumbnailImage> {
  const CustomVideoThumbnailImage({
    required this.videoUrl,
    this.imageFormat = ImageFormat.PNG,
    this.maxHeight = 0,
    this.maxWidth = 0,
    this.timeMs = 0,
    this.quality = 10,
    this.scale = 1.0,
  });

  /// The URL or path of the video from which to generate the thumbnail.
  final String videoUrl;

  /// The format of the generated thumbnail image.
  final ImageFormat imageFormat;

  /// The maximum height of the generated thumbnail image.
  final int maxHeight;

  /// The maximum width of the generated thumbnail image.
  final int maxWidth;

  /// The timestamp in milliseconds at which to generate the thumbnail.
  final int timeMs;

  /// The quality of the generated thumbnail image.
  final int quality;

  /// The scale to place in the [ImageInfo] object of the image.
  final double scale;

  @override
  Future<CustomVideoThumbnailImage> obtainKey(
    ImageConfiguration configuration,
  ) {
    return SynchronousFuture<CustomVideoThumbnailImage>(this);
  }

  @override
  @Deprecated('Will get replaced by loadImage in the next major version.')
  ImageStreamCompleter loadBuffer(
    CustomVideoThumbnailImage key,
    DecoderBufferCallback decode,
  ) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key, decode),
      scale: key.scale,
      debugLabel: key.videoUrl,
      informationCollector: () => <DiagnosticsNode>[
        DiagnosticsProperty<ImageProvider>('Image provider', this),
        DiagnosticsProperty<CustomVideoThumbnailImage>('Image key', key),
      ],
    );
  }

  @Deprecated('Will get replaced by loadImage in the next major version.')
  Future<ui.Codec> _loadAsync(
    CustomVideoThumbnailImage key,
    DecoderBufferCallback decode,
  ) async {
    assert(key == this, '$key is not $this');

    final Uint8List bytes = await VideoService.getVideoThumbnail(
      url: key.videoUrl,
      imageFormat: key.imageFormat,
      maxHeight: key.maxHeight,
      maxWidth: key.maxWidth,
      timeMs: key.timeMs,
      quality: key.quality,
    );

    if (bytes.lengthInBytes == 0) {
      throw Exception('VideoThumbnailImage is an empty file: ${key.videoUrl}');
    }

    final ui.ImmutableBuffer buffer =
        await ui.ImmutableBuffer.fromUint8List(bytes);
    return decode(buffer);
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is CustomVideoThumbnailImage &&
        other.videoUrl == videoUrl &&
        other.scale == scale;
  }

  @override
  int get hashCode => Object.hash(videoUrl, scale);

  @override
  String toString() {
    final String runtimeType =
        objectRuntimeType(this, 'StreamVideoThumbnailImage');
    return '$runtimeType($videoUrl, scale: $scale)';
  }
}
