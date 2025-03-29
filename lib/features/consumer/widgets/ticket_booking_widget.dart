import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/consumer/widgets/checkout_card_widget.dart';
import 'package:fullbooker/features/consumer/widgets/ticket_form_widget.dart';
import 'package:fullbooker/features/consumer/widgets/tickets_summary_widget.dart';
import 'package:fullbooker/features/host/models/old_product.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/ticket.dart';
import 'package:fullbooker/shared/widgets/old_secondary_button.dart';

class TicketBookingWidget extends StatefulWidget {
  final OldProduct product;
  final String productLocationName;
  final DateTime? selectedDate;

  const TicketBookingWidget({
    super.key,
    required this.product,
    required this.productLocationName,
    this.selectedDate,
  });

  @override
  State createState() => _TicketBookingWidgetState();
}

class _TicketBookingWidgetState extends State<TicketBookingWidget> {
  int selectedTickets = 1;
  BookingMode bookingMode = BookingMode.single;
  List<Ticket> tickets = <Ticket>[];
  ProductPricing? selectedPricings;

  void checkout() {
    if (tickets.isEmpty) {
      showSnackBar(addAtLeastOneTicket, context);
      return;
    }
    if (widget.selectedDate == null) {
      showSnackBar(selectADateString, context);
      return;
    }
    context.router.push(
      PaymentSummaryRoute(
        product: widget.product,
        locationName: widget.productLocationName,
        tickets: tickets,
        selectedDateTime: widget.selectedDate!,
      ),
    );
  }

  void addTicket(Ticket ticket) {
    switch (bookingMode) {
      case BookingMode.single:
        if (tickets.length >= 3) {
          showSnackBar(useBulkBookingString, context);
          return;
        }
        setState(() => tickets.add(ticket));
        break;
      case BookingMode.bulk:
        setState(() {
          tickets.clear();
          tickets.add(ticket);
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ticketsString,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 8),
        TicketFormWidget(
          index: 0,
          product: widget.product,
          productLocationName: widget.productLocationName,
          withIndexLabel: false,
          onAddClicked: addTicket,
          bookingMode: bookingMode,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width - 10,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: <Widget>[
                TicketsSummaryWidget(
                  tickets: tickets,
                  onRemove: (List<Ticket> ticketsNow) =>
                      setState(() => tickets = ticketsNow),
                  bookingMode: bookingMode,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            bookingMode == BookingMode.bulk
                                ? lessThan3Tickets
                                : moreThan3Tickets,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.7,
                          child: OldSecondaryButton(
                            _toggleBookingMode,
                            elevation: 0,
                            actionLabel: bookingMode == BookingMode.bulk
                                ? singleTickets
                                : bulkBooking,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        CheckoutCard(
          pricing: tickets.isEmpty ? null : tickets.first.pricing,
          quantity: bookingMode == BookingMode.single
              ? tickets.length
              : tickets.isEmpty
                  ? 0
                  : tickets.first.quantity,
          locationName: widget.productLocationName,
          onProceedClick: checkout,
        ),
      ],
    );
  }

  void _toggleBookingMode() {
    final BookingMode bookingModeLocal =
        bookingMode == BookingMode.bulk ? BookingMode.single : BookingMode.bulk;
    setState(() {
      tickets.clear();
      bookingMode = bookingModeLocal;
    });
  }
}
