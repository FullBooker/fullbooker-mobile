import 'package:flutter/material.dart';

class ProfileRatingWidget extends StatelessWidget {
  final String? profileImageUrl;
  final double rating;
  final int totalStars;
  final String hostName;

  const ProfileRatingWidget({
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
