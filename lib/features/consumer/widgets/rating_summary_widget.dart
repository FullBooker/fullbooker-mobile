import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';

class RatingSummaryWidget extends StatelessWidget {
  final double rating;
  final int totalReviews;
  final Map<int, double> ratingDistribution;

  const RatingSummaryWidget({
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
                            style: Theme.of(context).textTheme.bodyMedium,
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
                        style: Theme.of(context).textTheme.headlineLarge,
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
                        totalReviewCount(totalReviews),
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodySmall,
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
