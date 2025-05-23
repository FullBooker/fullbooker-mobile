import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/consumer/widgets/event_card_widget.dart';
import 'package:fullbooker/features/host/models/old_product.dart';
import 'package:fullbooker/shared/entities/spaces.dart';

class EventsSectionWidget extends StatefulWidget {
  final String sectionName;
  final Function? onSeAllClick;
  final List<OldProduct> events;

  const EventsSectionWidget({
    super.key,
    required this.sectionName,
    this.onSeAllClick,
    this.events = const <OldProduct>[],
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
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              if (widget.onSeAllClick == null)
                const SizedBox()
              else
                Text(
                  seeAllString,
                  style: Theme.of(context).textTheme.bodyLarge,
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
