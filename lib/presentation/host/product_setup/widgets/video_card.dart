import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:heroicons/heroicons.dart';
import 'package:video_player/video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() => _initialized = true);
      });
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
            // Video thumbnail
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
            else
              CachedNetworkImage(
                imageUrl: widget.videoUrl,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (
                  BuildContext context,
                  String url,
                  DownloadProgress progress,
                ) =>
                    Center(child: AppLoading()),
              ),

            // Remove icon
            if (!isReadOnly)
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: widget.onRemove,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: .6),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(8),
                    child: HeroIcon(
                      HeroIcons.xMark,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),

            // Duration
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
                      spacing: 4,
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
