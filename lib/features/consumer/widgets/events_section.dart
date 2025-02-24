import 'package:flutter/material.dart';
import 'package:fullbooker/features/consumer/widgets/event_card.dart';
import 'package:fullbooker/features/host/models/product.dart';

class EventsSection extends StatefulWidget {
  final String sectionName;
  final Function? onSeAllClick;
  final List<Product> events;

  const EventsSection(
      {super.key,
      required this.sectionName,
      this.onSeAllClick,
      this.events = const []})
      : assert(events.length <= 2);

  @override
  State<StatefulWidget> createState() => _EventsSectionState();
}

class _EventsSectionState extends State<EventsSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Flexible(
              child: Text(
                widget.sectionName,
                softWrap: true,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
            widget.onSeAllClick == null
                ? const SizedBox()
                : const Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xf0F55E00),
                    ),
                  )
          ]),
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 8,
            spacing: 12,
            children: List.generate(
              widget.events.length,
              (idx) {
                return EventCard(product: widget.events[idx]);
              },
            ),
          )
        ],
      ),
    );
  }
}
