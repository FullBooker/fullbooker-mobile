import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';

@RoutePage()
class ImagePreviewPage extends StatelessWidget {
  const ImagePreviewPage({
    super.key,
    required this.imageUrl,
    this.isOffline = false,
  });

  final String imageUrl;
  final bool isOffline;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Center(
        child: Hero(
          tag: imageUrl,
          child: InteractiveViewer(
            minScale: 1.0,
            maxScale: 4.0,
            child: Center(
              child: isOffline
                  ? Image.asset(imageUrl, fit: BoxFit.contain)
                  : CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.contain,
                      placeholder: (_, __) => AppLoading(),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
