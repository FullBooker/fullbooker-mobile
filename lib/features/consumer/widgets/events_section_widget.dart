import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/consumer/widgets/event_card_widget.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/entities/spaces.dart';

class EventsSectionWidget extends StatefulWidget {
  final String sectionName;
  final Function? onSeAllClick;
  final List<Product> events;

  const EventsSectionWidget({
    super.key,
    required this.sectionName,
    this.onSeAllClick,
    this.events = const <Product>[],
  }) : assert(events.length <= 2);

  @override
  State<StatefulWidget> createState() => _EventsSectionWidgetState();
}

class _EventsSectionWidgetState extends State<EventsSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Text(
                  widget.sectionName,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              if (widget.onSeAllClick == null)
                const SizedBox()
              else
                Text(
                  seeAllString,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
            ],
          ),
          smallVerticalSizedBox,
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 8,
            spacing: 12,
            children: List<EventCardWidget>.generate(
              widget.events.length,
              (int idx) {
                return EventCardWidget(product: widget.events[idx]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
