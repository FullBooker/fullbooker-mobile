import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/video_thumbnail.dart';
import 'package:heroicons/heroicons.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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

    return GestureDetector(
      onTap: () => context.router.push(
        FullscreenVideoPlayerRoute(videoUrl: widget.videoUrl),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            CustomVideoThumbnail(videoUrl: widget.videoUrl),
            Container(
              decoration:
                  BoxDecoration(color: Colors.black.withValues(alpha: 0.3)),
            ),
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
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.all(isReadOnly ? 12 : 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      HeroIcon(
                        HeroIcons.play,
                        size: 32,
                        color: Colors.white,
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
