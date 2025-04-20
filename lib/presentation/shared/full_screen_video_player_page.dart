import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:heroicons/heroicons.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class FullscreenVideoPlayerPage extends StatefulWidget {
  const FullscreenVideoPlayerPage({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  State<FullscreenVideoPlayerPage> createState() =>
      FullscreenVideoPlayerPageState();
}

class FullscreenVideoPlayerPageState extends State<FullscreenVideoPlayerPage> {
  late final VideoPlayerController controller;

  bool initialized = false;
  bool showControls = true;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() => initialized = true);
        controller.play();
      });

    controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    controller.pause();
    controller.dispose();
    super.dispose();
  }

  void _toggleControls() {
    setState(() => showControls = !showControls);
  }

  String formatDuration(Duration position) {
    final int minutes = position.inMinutes;
    final int seconds = position.inSeconds.remainder(60);
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(title: playVideo),
      body: initialized
          ? GestureDetector(
              onTap: _toggleControls,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Center(
                    child: AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    ),
                  ),
                  if (showControls)
                    Positioned(
                      bottom: 32,
                      left: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          spacing: 8,
                          children: <Widget>[
                            Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  spacing: 8,
                                  children: <Widget>[
                                    Text(
                                      formatDuration(
                                        controller.value.position,
                                      ),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      ' / ${formatDuration(controller.value.duration)}',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 8,
                                  children: <Widget>[
                                    IconButton(
                                      icon: const HeroIcon(
                                        HeroIcons.backward,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        final Duration newPosition =
                                            controller.value.position -
                                                const Duration(seconds: 10);
                                        controller.seekTo(
                                          newPosition >= Duration.zero
                                              ? newPosition
                                              : Duration.zero,
                                        );
                                      },
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          controller.value.isPlaying
                                              ? controller.pause()
                                              : controller.play();
                                        });
                                      },
                                      icon: HeroIcon(
                                        controller.value.isPlaying
                                            ? HeroIcons.pause
                                            : HeroIcons.play,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const HeroIcon(
                                        HeroIcons.forward,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        final Duration newPosition =
                                            controller.value.position +
                                                const Duration(seconds: 10);
                                        controller.seekTo(newPosition);
                                      },
                                    ),
                                    IconButton(
                                      icon: HeroIcon(
                                        isMuted
                                            ? HeroIcons.speakerXMark
                                            : HeroIcons.speakerWave,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isMuted = !isMuted;
                                          controller.setVolume(
                                            isMuted ? 0.0 : 1.0,
                                          );
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            VideoProgressIndicator(
                              controller,
                              allowScrubbing: true,
                              padding: EdgeInsets.zero,
                              colors: VideoProgressColors(
                                playedColor: theme.primaryColor,
                                bufferedColor:
                                    theme.primaryColor.withValues(alpha: 0.3),
                                backgroundColor: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            )
          : const AppLoading(),
    );
  }
}
