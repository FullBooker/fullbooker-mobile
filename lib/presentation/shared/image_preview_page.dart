import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/constants.dart';
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.imageUrls?.length ?? 0,
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
    );
  }
}
