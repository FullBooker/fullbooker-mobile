import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';

@RoutePage()
class ImagePreviewPage extends StatefulWidget {
  const ImagePreviewPage({
    super.key,
    required this.imageUrls,
    required this.imageUrl,
    this.isOffline = false,
  });

  final List<String?>? imageUrls;
  final String imageUrl;
  final bool isOffline;

  @override
  State<ImagePreviewPage> createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {
  late final PageController _pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.imageUrls?.indexOf(widget.imageUrl) ?? 0;
    if (currentIndex < 0) currentIndex = 0;
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int total = widget.imageUrls?.length ?? 0;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView.builder(
            controller: _pageController,
            itemCount: total,
            onPageChanged: (int index) {
              setState(() => currentIndex = index);
            },
            itemBuilder: (BuildContext context, int index) {
              final String image = widget.imageUrls![index] ?? UNKNOWN;

              return Hero(
                tag: image,
                child: InteractiveViewer(
                  minScale: 1.0,
                  maxScale: 4.0,
                  child: Center(
                    child: widget.isOffline
                        ? Image.asset(image, fit: BoxFit.contain)
                        : CachedNetworkImage(
                            imageUrl: image,
                            fit: BoxFit.contain,
                            errorWidget: (
                              BuildContext context,
                              String url,
                              Object error,
                            ) =>
                                Image.asset(
                              productImageZeroState,
                              height: MediaQuery.of(context).size.height * .2,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            progressIndicatorBuilder: (
                              BuildContext context,
                              String url,
                              DownloadProgress progress,
                            ) =>
                                const Center(child: AppLoading()),
                          ),
                  ),
                ),
              );
            },
          ),
          if (total > 1)
            Positioned(
              bottom: 32,
              child: Column(
                children: <Widget>[
                  Text(
                    '${currentIndex + 1}/$total',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List<AnimatedContainer>.generate(total, (int index) {
                      final bool isActive = index == currentIndex;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: isActive ? 12 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: isActive ? Colors.white : Colors.white24,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
