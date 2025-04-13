import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
      ),
      body: Center(
        child: Hero(
          tag: imageUrl,
          child: isOffline
              ? Image.asset(imageUrl, fit: BoxFit.cover)
              : CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
