import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/features/consumer/pages/checkout.dart';
import 'package:fullbooker/features/consumer/pages/purchase_summary.dart';
import 'package:fullbooker/features/consumer/widgets/tickets_form.dart';
import 'package:fullbooker/features/consumer/widgets/tickets_summary.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("Tickets",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      TicketForm(
          index: 0,
          product: widget.product,
          productLocationName: widget.productLocationName,
          withIndexLabel: false,
          onAddClicked: addTicket,
          bookingMode: bookingMode),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width - 10,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              TicketsSummary(
                  tickets: tickets,
                  onRemove: (ticketsNow) =>
                      setState(() => tickets = ticketsNow),
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
                  const SizedBox(height: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: SecondaryButton(_toggleBookingMode,
                        elevation: 0,
                        actionLabel: bookingMode == BookingMode.bulk
                            ? "Single Tickets"
                            : "Bulk Booking"),
                  )
                ]),
              )),
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
          onProceedClick: checkout),
    ]);
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
