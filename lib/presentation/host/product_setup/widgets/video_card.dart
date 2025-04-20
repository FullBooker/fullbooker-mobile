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
  });

  final String videoUrl;
  final VoidCallback onRemove;

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

  @override
  Widget build(BuildContext context) {
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
            // Thumbnail or fallback
            if (_initialized)
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            else
              CachedNetworkImage(
                imageUrl: widget.videoUrl,
                fit: BoxFit.cover,
                placeholder: (_, __) => AppLoading(),
                errorWidget: (_, __, ___) => AppLoading(),
              ),

            // Play icon overlay
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withValues(alpha: 0.6),
                ),
                padding: EdgeInsets.all(12),
                child: HeroIcon(
                  HeroIcons.play,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),

            // Remove button
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: widget.onRemove,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 18,
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
