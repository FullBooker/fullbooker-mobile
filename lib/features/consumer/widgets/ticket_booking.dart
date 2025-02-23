import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/features/consumer/pages/checkout.dart';
import 'package:fullbooker/features/consumer/pages/purchase_summary.dart';
import 'package:fullbooker/features/consumer/widgets/tickets_form.dart';
import 'package:fullbooker/features/consumer/widgets/tickets_summary.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/widgets/button.dart';

enum BookingMode { bulk, single }

class TicketBookingWidget extends StatefulWidget {
  final Product product;
  final String productLocationName;
  final DateTime? selectedDate;

  const TicketBookingWidget(
      {super.key,
      required this.product,
      required this.productLocationName,
      this.selectedDate});

  @override
  State createState() => _TicketBookingWidgetState();
}

class _TicketBookingWidgetState extends State<TicketBookingWidget> {
  int selectedTickets = 1;
  BookingMode bookingMode = BookingMode.single;
  List<Ticket> tickets = [];
  ProductPricing? selectedPricings;

  void goToCheckout() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => PaymentSummaryWidget(
              product: widget.product,
              locationName: widget.productLocationName,
              tickets: tickets,
              selectedDateTime: widget.selectedDate!)));
    });
  }

  void checkout() {
    if (tickets.isEmpty) {
      showSnackBar("Please add at least one ticket", context);
      return;
    }
    if (widget.selectedDate == null) {
      showSnackBar("Please set a date", context);
      return;
    }
    goToCheckout();
  }

  void addTicket(Ticket ticket) {
    switch (bookingMode) {
      case BookingMode.single:
        if (tickets.length >= 3) {
          showSnackBar(
              "Please use bulk booking if you need more than 3 tickets",
              context);
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
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Center(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text("Tickets",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )),
          TicketForm(
              index: 0,
              product: widget.product,
              productLocationName: widget.productLocationName,
              withIndexLabel: false,
              onAddClicked: addTicket,
              bookingMode: bookingMode),
          TicketsSummary(
              tickets: tickets,
              onRemove: (ticketsNow) => setState(() => tickets = ticketsNow),
              bookingMode: bookingMode),
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(bookingMode == BookingMode.bulk
                    ? "3 tickets or less ?"
                    : "More than 3 tickets?"),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.7,
                child: Button(_toggleBookingMode,
                    actionLabel: bookingMode == BookingMode.bulk
                        ? "Single Tickets"
                        : "Bulk Booking",
                    color: const Color(0xf0FADFCF),
                    actionLabelColor: Colors.black),
              )
            ]),
          )),
          CheckoutCard(
              pricing: tickets.isEmpty ? null : tickets.first.pricing,
              quantity: bookingMode == BookingMode.single
                  ? tickets.length
                  : tickets.isEmpty
                      ? 0
                      : tickets.first.quantity,
              locationName: widget.productLocationName,
              onProceedClick: checkout),
        ]));
  }

  void _toggleBookingMode() {
    var bookingModeLocal =
        bookingMode == BookingMode.bulk ? BookingMode.single : BookingMode.bulk;
    setState(() {
      tickets.clear();
      bookingMode = bookingModeLocal;
    });
  }
}
