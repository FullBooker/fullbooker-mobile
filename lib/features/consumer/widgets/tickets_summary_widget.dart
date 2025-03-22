import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/entities/ticket.dart';

class TicketsSummaryWidget extends StatefulWidget {
  final List<Ticket> tickets;
  final BookingMode bookingMode;
  final Function(List<Ticket>)? onRemove;

  const TicketsSummaryWidget({
    super.key,
    this.tickets = const <Ticket>[],
    this.onRemove,
    required this.bookingMode,
  });

  @override
  State<StatefulWidget> createState() => _TicketsSummaryWidgetState();
}

class _TicketsSummaryWidgetState extends State<TicketsSummaryWidget> {
  // Sample list of tickets (this could come from an API or user input)
  late List<Ticket> tickets;

  // Function to delete a ticket entry
  void deleteTicket(int index) {
    setState(() {
      tickets.removeAt(index);
      if (widget.onRemove != null) widget.onRemove!(tickets);
    });
  }

  @override
  Widget build(BuildContext context) {
    tickets = widget.tickets;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Title
          Text(
            ticketSummaryString,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          smallVerticalSizedBox,

          // Table
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              border: TableBorder.all(color: Colors.grey.shade400),
              headingRowHeight: 40,
              columnSpacing: 20,
              columns: <DataColumn>[
                DataColumn(
                  label: Text(
                    nameString,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    idNumber,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    phonNumberString,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    emailAddressString,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    quantityString,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                DataColumn(label: Text('')),
              ],
              rows: tickets.asMap().entries.map((MapEntry<int, Ticket> entry) {
                final int index = entry.key;
                final Ticket ticket = entry.value;

                final List<DataCell> cells = <DataCell>[
                  DataCell(Text(ticket.name)),
                  DataCell(Text(ticket.id)),
                  DataCell(Text(ticket.phone)),
                  DataCell(Text(ticket.email)),
                  DataCell(Text(ticket.quantity.toString())),
                  DataCell(
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.standard,
                      ),
                      onPressed: () => deleteTicket(index),
                      child: Text(
                        deleteString,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ];
                return DataRow(cells: cells);
              }).toList(),
            ),
          ),
          if (tickets.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(ticketsWillAppearString),
              ),
            ),
        ],
      ),
    );
  }
}
