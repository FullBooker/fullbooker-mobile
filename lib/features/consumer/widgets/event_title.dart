import 'package:flutter/material.dart';

class EventTitleSection extends StatelessWidget {
  const EventTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Music Concert, Eras tour Taylor Swift",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.pin_drop, color: Colors.grey, size: 16),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                "Carnivore grounds, 7km away",
                style: TextStyle(color: Colors.grey[400], fontSize: 14),
                softWrap: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: [
            SizedBox(
              width: (width / 2) - 24,
              child: Row(children: [
                const Icon(Icons.calendar_month, color: Colors.grey, size: 16),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    "22–24, Feb, 24",
                    style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    softWrap: true,
                  ),
                )
              ]),
            ),
            SizedBox(
              width: (width / 2) - 24,
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(children: [
                  const Icon(Icons.timer_outlined,
                      color: Colors.grey, size: 16),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      "2:30PM – 4:30AM",
                      style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      softWrap: true,
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      ],
    );
  }
}
