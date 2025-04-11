import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';

class ImageCarouselWidget extends StatefulWidget {
  const ImageCarouselWidget({super.key, required this.imageUrls});

  final List<String?>? imageUrls;

  @override
  State<ImageCarouselWidget> createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * .25,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayCurve: Curves.easeInOut,
            viewportFraction: 1.0,
            onPageChanged: (int index, CarouselPageChangedReason reason) {
              setState(() => _currentIndex = index);
            },
          ),
          items: widget.imageUrls?.map((String? imageUrl) {
            if (imageUrl != null) {
              return CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (BuildContext context, String url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (BuildContext context, String url, Object error) =>
                    const Icon(Icons.error),
              );
            } else {
              return Image.asset(
                productImageZeroState,
                fit: BoxFit.cover,
              );
            }
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              List<Widget>.generate(widget.imageUrls?.length ?? 0, (int index) {
            final bool isActive = index == _currentIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: isActive
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).dividerColor,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }
}
