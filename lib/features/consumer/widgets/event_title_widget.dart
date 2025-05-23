import 'package:flutter/material.dart';
import 'package:fullbooker/shared/entities/spaces.dart';

// TODO!!(abiud): pass an event details object here and update the displays
class EventTitleWidget extends StatelessWidget {
  const EventTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Music Concert, Eras tour Taylor Swift',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        smallVerticalSizedBox,
        Row(
          children: <Widget>[
            const Icon(Icons.pin_drop, color: Colors.grey, size: 16),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                'Carnivore grounds, 7km away',
                style: Theme.of(context).textTheme.bodySmall,
                softWrap: true,
              ),
            ),
          ],
        ),
        smallVerticalSizedBox,
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: (width / 2) - 24,
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      '22–24, Feb, 24',
                      style: Theme.of(context).textTheme.bodyLarge,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: (width / 2) - 24,
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.timer_outlined,
                      color: Colors.grey,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        '2:30PM – 4:30AM',
                        style: Theme.of(context).textTheme.bodyMedium,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
