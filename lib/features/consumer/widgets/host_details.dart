import 'package:flutter/material.dart';
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
  final String hostID;

  const HostDetails({super.key, required this.hostID});

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
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
        width: width - 40,
        child: AspectRatio(
            aspectRatio: 8,
            child: isLoading
                ? _buildShimmerEffect(width)
                : const ProfileRating(
                    profileImageUrl: null,
                    rating: 4,
                    hostName: "Kevin Laichana")));
  }
}
