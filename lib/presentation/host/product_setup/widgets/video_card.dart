import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';
import 'package:heroicons/heroicons.dart';
import 'package:video_player/video_player.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({
    super.key,
    required this.videoUrl,
    required this.onRemove,
    this.readOnly = false,
  });

  final String videoUrl;
  final VoidCallback onRemove;
  final bool readOnly;

  @override
  State<VideoCard> createState() => VideoCardState();
}

class VideoCardState extends State<VideoCard> {
  late final VideoPlayerController _controller;
  bool _initialized = false;
  String? _thumbnailPath;

  @override
  void initState() {
    super.initState();
    _generateThumbnail();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        if (mounted) {
          setState(() => _initialized = true);
        }
      });
  }

  Future<void> _generateThumbnail() async {
    try {
      final XFile file = await VideoThumbnail.thumbnailFile(
        video: widget.videoUrl,
        quality: 75,
      );

      if (File(file.path).existsSync()) {
        setState(() => _thumbnailPath = file.path);
      } else {
        debugPrint('Thumbnail path was null or does not exist');
      }
    } catch (e) {
      debugPrint('Thumbnail generation failed: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    final int minutes = duration.inMinutes;
    final int seconds = duration.inSeconds.remainder(60);
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final bool isReadOnly = widget.readOnly;

    const double radius = 8;
    return GestureDetector(
      onTap: () => context.router.push(
        FullscreenVideoPlayerRoute(videoUrl: widget.videoUrl),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            if (_initialized)
              FittedBox(
                fit: BoxFit.cover,
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              )
            else if (_thumbnailPath != null &&
                File(_thumbnailPath!).existsSync())
              Image.file(
                File(_thumbnailPath!),
                fit: BoxFit.cover,
              )
            else
              AppLoading(),
            if (!isReadOnly)
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: widget.onRemove,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const HeroIcon(
                      HeroIcons.xMark,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            if (_initialized)
              Positioned(
                bottom: isReadOnly ? 0 : 8,
                left: 0,
                right: 0,
                top: isReadOnly ? 0 : null,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: isReadOnly ? 12 : 8,
                      horizontal: 12,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const HeroIcon(
                          HeroIcons.play,
                          size: 24,
                          color: Colors.white,
                        ),
                        if (!isReadOnly)
                          Text(
                            formatDuration(_controller.value.duration),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.white),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
