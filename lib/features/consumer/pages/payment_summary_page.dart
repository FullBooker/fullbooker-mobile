import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/consumer/widgets/mpesa_checkout_instructions_widget.dart';
import 'package:fullbooker/features/consumer/widgets/payment_forms.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/entities/ticket.dart';
import 'package:fullbooker/shared/widgets/information_modal.dart';
import 'package:fullbooker/shared/widgets/standard_nav_bar.dart';
import 'package:intl/intl.dart';

@RoutePage()
class PaymentSummaryPage extends StatelessWidget {
  const PaymentSummaryPage({
    super.key,
    required this.product,
    required this.locationName,
    required this.tickets,
    required this.selectedDateTime,
  });

  final String locationName;
  final Product product;
  final DateTime selectedDateTime;
  final List<Ticket> tickets;

  Future<dynamic> showMpesaModal(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return InformationModal(
          message: MpesaCheckoutInstructionsWidget(ticket: tickets.first),
          actionTitle: confirmPaymentString,
          action: () => context.router.push(
            PaymentConfirmationRoute(
              product: product,
              locationName: locationName,
              ticket: tickets[0],
            ),
          ),
          height: 330,
          withSuccessTick: false,
          topDividerColor: const Color(0xf02FBD6A),
          topDividerHeight: 20,
        );
      },
    );
  }

  // Method to build input fields
  Widget buildInputField(String hint, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                hint,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Flexible(
                child: Text(
                  value,
                  softWrap: true,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    double getGrandTotal() {
      return tickets.fold<double>(0, (double initial, Ticket ticket) {
        return initial + (ticket.quantity * double.parse(ticket.pricing.cost));
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          const StandardNavBar(showSearchBar: false, iconsColor: Colors.black),
      body: SafeArea(
        child: Container(
          width: screenWidth,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: Text(
                    summaryString,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      '${product.name}, $locationName',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      ticketDetailsString,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),

                // Form fields
                buildInputField(nameString, tickets.first.name, context),
                buildInputField(
                  dateAndTimeString,
                  DateFormat('E dd MMMM').format(selectedDateTime),
                  context,
                ),
                buildInputField(
                  noOfTickets,
                  (tickets.length == 1
                          ? tickets.first.quantity
                          : tickets.length)
                      .toString(),
                  context,
                ),
                buildInputField(totalHours, '8 hours', context),

                // Grand total
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          grandTotal,
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'KES ${getGrandTotal()}',
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),

                // Promo Code Input
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenHeight * 0.015,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.card_giftcard, color: Colors.orange),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        child: Text(
                          promoCode,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                PaymentForm(onCompleteClick: () => showMpesaModal(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
