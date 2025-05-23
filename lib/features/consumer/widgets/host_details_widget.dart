import 'package:flutter/material.dart';
import 'package:fullbooker/features/consumer/widgets/profile_rating_widget.dart';
import 'package:fullbooker/features/host/models/old_product.dart';
import 'package:shimmer/shimmer.dart';

class HostDetailsWidget extends StatefulWidget {
  final OldProduct product;
  final double width;

  const HostDetailsWidget({
    super.key,
    required this.product,
    required this.width,
  });

  @override
  State<StatefulWidget> createState() => _HostDetailsWidgetState();
}

class _HostDetailsWidgetState extends State<HostDetailsWidget> {
  bool isLoading = true;

  Widget _buildShimmerEffect(double width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: 200,
        color: Colors.grey[300],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? _buildShimmerEffect(widget.width)
        // TODO!!(abiud): replace this with actual data
        : SizedBox(
            width: widget.width,
            child: const ProfileRatingWidget(
              profileImageUrl: 'https://i.imgur.com/GEPhBnS.png',
              rating: 4,
              hostName: 'Kevin Laichena',
            ),
          );
  }
}
