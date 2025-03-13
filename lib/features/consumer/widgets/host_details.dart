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
      children: <Widget>[
        CircleAvatar(
          radius: 24,
          backgroundImage:
              profileImageUrl == null ? null : NetworkImage(profileImageUrl!),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hosted by $hostName',
                softWrap: true,
                overflow: TextOverflow.ellipsis, // Handles overflow
                maxLines: 2, // Limits to 2 lines
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Row(
                children: List<Icon>.generate(totalStars, (int index) {
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
        : SizedBox(
            width: widget.width,
            child: const ProfileRating(
              profileImageUrl: 'https://i.imgur.com/GEPhBnS.png',
              rating: 4,
              hostName: 'Kevin Laichena',
            ),
          );
  }
}
