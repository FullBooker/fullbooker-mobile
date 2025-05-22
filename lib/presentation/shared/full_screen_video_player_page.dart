import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/sentry_service.dart';
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
  late final VideoPlayerController _controller;
  late final VoidCallback _controllerListener;

  bool _initialized = false;
  bool _showControls = true;
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) => _ensureReady())
      ..setLooping(false);

    _controllerListener = () {
      final VideoPlayerValue v = _controller.value;
      if (v.hasError) {
        debugPrint('VideoPlayer error: ${v.errorDescription}');
        SentryService().reportError(hint: v.errorDescription!);
      }
      if (mounted) setState(() {});
    };
    _controller.addListener(_controllerListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_controllerListener);
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  void _ensureReady() {
    if (!mounted) return;
    if (_controller.value.size != Size.zero) {
      _onReady();
    } else {
      Future<void>.delayed(const Duration(milliseconds: 200), () {
        if (!mounted) return;
        if (_controller.value.size != Size.zero) {
          _onReady();
        }
      });
    }
  }

  void _onReady() {
    setState(() => _initialized = true);
    _controller.play();
  }

  void _toggleControls() {
    setState(() => _showControls = !_showControls);
  }

  String _formatDuration(Duration position) {
    final int minutes = position.inMinutes;
    final int seconds = position.inSeconds.remainder(60);
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black),
      body: _initialized
          ? GestureDetector(
              onTap: _toggleControls,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  RepaintBoundary(
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                  if (_showControls)
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
                                      _formatDuration(
                                        _controller.value.position,
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                    Text(
                                      ' / ${_formatDuration(_controller.value.duration)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: Colors.white
                                                .withValues(alpha: .6),
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
                                            _controller.value.position -
                                                const Duration(seconds: 10);
                                        _controller.seekTo(
                                          newPosition >= Duration.zero
                                              ? newPosition
                                              : Duration.zero,
                                        );
                                      },
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _controller.value.isPlaying
                                              ? _controller.pause()
                                              : _controller.play();
                                        });
                                      },
                                      icon: HeroIcon(
                                        _controller.value.isPlaying
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
                                            _controller.value.position +
                                                const Duration(seconds: 10);
                                        _controller.seekTo(newPosition);
                                      },
                                    ),
                                    IconButton(
                                      icon: HeroIcon(
                                        _isMuted
                                            ? HeroIcons.speakerXMark
                                            : HeroIcons.speakerWave,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isMuted = !_isMuted;
                                          _controller.setVolume(
                                            _isMuted ? 0.0 : 1.0,
                                          );
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            VideoProgressIndicator(
                              _controller,
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
