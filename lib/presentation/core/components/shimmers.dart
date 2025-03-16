import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LandingPageShimmer extends StatelessWidget {
  const LandingPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        color: Colors.grey[300],
      ),
    );
  }
}
