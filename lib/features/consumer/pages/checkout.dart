import 'package:flutter/material.dart';
import 'package:fullbooker/features/consumer/pages/payment_confirmation.dart';
import 'package:fullbooker/features/consumer/widgets/payment_forms.dart';
import 'package:fullbooker/features/consumer/widgets/tickets_summary.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:fullbooker/shared/widgets/information_modal.dart';
import 'package:intl/intl.dart';

class MpesaCheckoutInstructions extends StatelessWidget {
  final Ticket ticket;

  const MpesaCheckoutInstructions({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "MPESA Checkout sent to ${ticket.phone}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Payment Alert",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Follow the instructions below:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              "Instructions to Pay:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildBulletPoint("Check on a payment pop-up on your phone.",
                isBold: true),
            _buildBulletPoint("Input your MPESA PIN and click OK.",
                isBold: true),
            _buildBulletPoint("An MPESA confirmation SMS will be sent to you.",
                isBold: true),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InstructionText extends StatelessWidget {
  final String text;
  final bool isBold;

  const InstructionText(this.text, {super.key, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}

class PaymentSummaryWidget extends StatelessWidget {
  final Product product;
  final String locationName;
  final List<Ticket> tickets;
  final DateTime selectedDateTime;

  const PaymentSummaryWidget(
      {super.key,
      required this.product,
      required this.locationName,
      required this.tickets,
      required this.selectedDateTime});

  Future showMpesaModal(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return InformationModal(
            title: "",
            message: MpesaCheckoutInstructions(ticket: tickets.first),
            actionTitle: "Confirm Payment",
            action: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => PaymentConfirmationScreen(
                      product: product,
                      locationName: locationName,
                      ticket: tickets[0])));
            },
            height: 330,
            withSuccessTick: false,
            topDividerColor: const Color(0xf02FBD6A),
            topDividerHeight: 20,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double getGrandTotal() {
      return tickets.fold<double>(0, (initial, ticket) {
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
              vertical: 10, horizontal: 20), // Dynamic padding
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            // Make it scrollable
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.02),
                const Center(
                  child: Text(
                    "Summary",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey)),
                  child: Center(
                    child: Text(
                      "${product.name}, $locationName",
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Center(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text("Ticket Details",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic))),
                ),

                // Form fields
                buildInputField("Name", tickets.first.name),
                buildInputField("Date & Time",
                    DateFormat("E dd MMMM").format(selectedDateTime)),
                buildInputField(
                    "No. of tickets",
                    (tickets.length == 1
                            ? tickets.first.quantity
                            : tickets.length)
                        .toString()),
                buildInputField("Total Hours", "8 hours"),

                // Grand total
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Grand Total",
                          style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                      Text("KES ${getGrandTotal()}",
                          style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                    ],
                  ),
                ),

                // Promo Code Input
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                      vertical: screenHeight * 0.015),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.card_giftcard, color: Colors.orange),
                      SizedBox(width: screenWidth * 0.02),
                      const Expanded(
                        child: Text("Enter your promo code here",
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                PaymentForm(onCompleteClick: () => showMpesaModal(context))
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to build input fields
  Widget buildInputField(String hint, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(hint,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
              Text(value,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }

  // Payment Button Widget
  Widget paymentButton(
      String text, Color bgColor, Color textColor, double screenWidth,
      {double borderSize = 1, Color borderColor = Colors.grey}) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.02, horizontal: screenWidth * 0.05),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: borderSize)),
      child: Text(text,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
    );
  }
}
