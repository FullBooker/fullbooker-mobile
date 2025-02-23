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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage:
              profileImageUrl == null ? null : NetworkImage(profileImageUrl!),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hosted by $hostName",
                softWrap: true,
                overflow: TextOverflow.ellipsis, // Handles overflow
                maxLines: 2, // Limits to 2 lines
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Row(
                children: List.generate(totalStars, (index) {
                  return Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color:
                        index < rating ? const Color(0xf0E4A70A) : Colors.grey,
                    size: 20,
                  );
                }),
              ),
            ],
          ),
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
    return isLoading
        ? _buildShimmerEffect(widget.width)
        : const ProfileRating(
            profileImageUrl: null, rating: 4, hostName: "Kevin Laichena");
  }
}
