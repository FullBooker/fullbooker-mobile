import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:heroicons/heroicons.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class FullscreenVideoPlayerPage extends StatefulWidget {
  const FullscreenVideoPlayerPage({
    super.key,
    required this.videoUrl,
  });

  final String videoUrl;

  @override
  State<FullscreenVideoPlayerPage> createState() =>
      FullscreenVideoPlayerPageState();
}

class FullscreenVideoPlayerPageState extends State<FullscreenVideoPlayerPage> {
  late final VideoPlayerController controller;
  bool initialized = false;
  bool showControls = true;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() => initialized = true);
        controller.play();
      });
  }

  @override
  void dispose() {
    controller.pause();
    controller.dispose();
    super.dispose();
  }

  void toggleControls() {
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
      appBar: CustomAppBar(title: playVideo, showBell: false),
      body: initialized
          ? GestureDetector(
              onTap: toggleControls,
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
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withValues(alpha: 0.3),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              spacing: 8,
                              children: <Widget>[
                                Text(
                                  formatDuration(
                                    controller.value.position,
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.white),
                                ),
                                Expanded(
                                  child: VideoProgressIndicator(
                                    controller,
                                    allowScrubbing: true,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    colors: VideoProgressColors(
                                      playedColor: theme.primaryColor,
                                      bufferedColor: theme.primaryColor
                                          .withValues(alpha: 0.3),
                                      backgroundColor:
                                          Colors.black.withValues(alpha: .6),
                                    ),
                                  ),
                                ),
                                Text(
                                  formatDuration(controller.value.duration),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  icon: HeroIcon(
                                    controller.value.isPlaying
                                        ? HeroIcons.stop
                                        : HeroIcons.play,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      controller.value.isPlaying
                                          ? controller.pause()
                                          : controller.play();
                                    });
                                  },
                                ),
                              ],
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
