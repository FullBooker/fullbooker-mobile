import 'package:flutter/material.dart';
import 'package:fullbooker/features/consumer/utils.dart';

class EventMetaWidget extends StatelessWidget {
  final Color hearColor;
  final double width;

  const EventMetaWidget({
    super.key,
    required this.width,
    this.hearColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 4, top: 8),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width * 0.8),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Text(
                  randomCategory(),
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8, right: 4),
          child: Icon(Icons.favorite, color: Colors.white),
        ),
      ],
    );
  }
}
