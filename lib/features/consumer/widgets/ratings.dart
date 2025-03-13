import 'package:flutter/material.dart';

class RatingSummary extends StatelessWidget {
  final double rating;
  final int totalReviews;
  final Map<int, double> ratingDistribution;

  const RatingSummary({
    super.key,
    this.rating = 4.0,
    this.totalReviews = 52,
    this.ratingDistribution = const <int, double>{
      5: 0.8,
      4: 0.6,
      3: 0.4,
      2: 0.1,
      1: 0.05,
    },
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: SizedBox(
        width: width - 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: ratingDistribution.entries
                        .map((MapEntry<int, double> entry) {
                      return Row(
                        children: <Widget>[
                          Text(
                            '${entry.key} ',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: width / 2.5,
                            child: LinearProgressIndicator(
                              value: entry.value,
                              color: Colors.orange,
                              backgroundColor: Colors.transparent,
                              minHeight: 6,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '$rating',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: List<Icon>.generate(5, (int index) {
                          return Icon(
                            Icons.star,
                            color: index < rating ? Colors.orange : Colors.grey,
                          );
                        }),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '$totalReviews Reviews',
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final Map<String, dynamic> review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 24,
                backgroundImage: review['profilePic'] == null
                    ? null
                    : NetworkImage(review['profilePic']),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      review['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Row(
                          children: List.generate(5, (int index) {
                            return Icon(
                              index < review['rating']
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.orange,
                              size: 16,
                            );
                          }),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          review['timeAgo'],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            review['review'],
            style: const TextStyle(fontSize: 14, color: Color(0xff808080)),
          ),
          const SizedBox(height: 8),
          Divider(color: Colors.grey[300]),
        ],
      ),
    );
  }
}
