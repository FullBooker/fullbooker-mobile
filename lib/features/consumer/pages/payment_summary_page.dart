import 'package:flutter/material.dart';
import 'package:fullbooker/features/consumer/pages/payment_confirmation.dart';
import 'package:fullbooker/features/consumer/widgets/mpesa_checkout_instructions_widget.dart';
import 'package:fullbooker/features/consumer/widgets/payment_forms.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/entities/ticket.dart';
import 'package:fullbooker/shared/widgets/information_modal.dart';
import 'package:fullbooker/shared/widgets/standard_nav_bar.dart';
import 'package:intl/intl.dart';

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
          actionTitle: 'Confirm Payment',
          action: () {
            Navigator.of(context).push(
              MaterialPageRoute<PaymentConfirmationScreen>(
                builder: (_) => PaymentConfirmationScreen(
                  product: product,
                  locationName: locationName,
                  ticket: tickets[0],
                ),
              ),
            );
          },
          height: 330,
          withSuccessTick: false,
          topDividerColor: const Color(0xf02FBD6A),
          topDividerHeight: 20,
        );
      },
    );
  }

  // Method to build input fields
  Widget buildInputField(String hint, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                hint,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Flexible(
                child: Text(
                  value,
                  softWrap: true,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }

  // Payment Button Widget
  Widget paymentButton(
    String text,
    Color bgColor,
    Color textColor,
    double screenWidth, {
    double borderSize = 1,
    Color borderColor = Colors.grey,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenWidth * 0.02,
        horizontal: screenWidth * 0.05,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: borderSize),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
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
                const Center(
                  child: Text(
                    'Summary',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
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
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Ticket Details',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),

                // Form fields
                buildInputField('Name', tickets.first.name),
                buildInputField(
                  'Date & Time',
                  DateFormat('E dd MMMM').format(selectedDateTime),
                ),
                buildInputField(
                  'No. of tickets',
                  (tickets.length == 1
                          ? tickets.first.quantity
                          : tickets.length)
                      .toString(),
                ),
                buildInputField('Total Hours', '8 hours'),

                // Grand total
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          'Grand Total',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'KES ${getGrandTotal()}',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
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
                      const Expanded(
                        child: Text(
                          'Enter your promo code here',
                          style: TextStyle(color: Colors.grey),
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
