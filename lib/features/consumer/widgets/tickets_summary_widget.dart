import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/shared/entities/enums.dart';
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
          const Text(
            'Tickets Summary',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Table
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              border: TableBorder.all(color: Colors.grey.shade400),
              headingRowHeight: 40,
              columnSpacing: 20,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'ID/PASSPORT',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Phone number',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Quantity',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
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
                child: Text('Tickets will appear here when added'),
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
