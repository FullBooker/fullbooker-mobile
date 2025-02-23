import 'package:flutter/material.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:shimmer/shimmer.dart';

class ProfileRating extends StatelessWidget {
  final String? profileImageUrl;
  final double rating;
  final int totalStars;
  final String hostName;

  const ProfileRating({
    super.key,
    required this.profileImageUrl,
    required this.rating,
    required this.hostName,
    this.totalStars = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Profile Picture
        CircleAvatar(
          radius: 20, // Adjust size as needed
          backgroundImage:
              profileImageUrl == null ? null : NetworkImage(profileImageUrl!),
        ),
        const SizedBox(width: 8), // Spacing between image and stars

        Column(
          children: [
            const Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Text("Hosted by Some Person")),
            Row(
              children: List.generate(totalStars, (index) {
                return Icon(
                  index < rating
                      ? Icons.star
                      : Icons.star_border, // Filled or empty star
                  color: index < rating ? Colors.amber : Colors.grey,
                  size: 20,
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}

class HostDetails extends StatefulWidget {
  final Product product;
  final double width;

  const HostDetails({super.key, required this.product, required this.width});

  @override
  State<StatefulWidget> createState() => _HostDetailsState();
}

class _HostDetailsState extends State<HostDetails> {
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
    return SizedBox(
        width: widget.width,
        child: isLoading
            ? _buildShimmerEffect(widget.width)
            : const ProfileRating(
                profileImageUrl: null, rating: 4, hostName: "Kevin Laichana"));
  }
}
