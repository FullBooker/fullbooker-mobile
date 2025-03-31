import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';

class ProductCarouselWidget extends StatefulWidget {
  const ProductCarouselWidget({super.key, required this.imageUrls});

  final List<String?>? imageUrls;

  @override
  State<ProductCarouselWidget> createState() => _ProductCarouselWidgetState();
}

class _ProductCarouselWidgetState extends State<ProductCarouselWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * .3,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 10),
            autoPlayCurve: Curves.easeInOut,
            viewportFraction: 1.0,
            onPageChanged: (int index, CarouselPageChangedReason reason) {
              setState(() => _currentIndex = index);
            },
          ),
          items: widget.imageUrls?.map((String? imageUrl) {
            return CachedNetworkImage(
              // TODO(abiud): in future, replace with a default product image
              imageUrl: imageUrl ?? mockProductSetupImageURLs.first,
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: (BuildContext context, String url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (BuildContext context, String url, Object error) =>
                  const Icon(Icons.error),
            );
          }).toList(),
        ),
        Positioned(
          bottom: 12,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: .6),
              borderRadius: BorderRadius.circular(56),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(widget.imageUrls?.length ?? 0,
                  (int index) {
                final bool isActive = index == _currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: isActive
                        ? Colors.white.withValues(alpha: .7)
                        : Colors.white.withValues(alpha: .2),
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
