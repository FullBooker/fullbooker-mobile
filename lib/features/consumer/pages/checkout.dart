import 'package:flutter/material.dart';
import 'package:fullbooker/features/consumer/pages/payment_confirmation.dart';
import 'package:fullbooker/features/host/models/product.dart';

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
  const PaymentSummaryWidget(
      {super.key, required this.product, required this.locationName});

  void showMpesaModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Green progress bar
              Container(
                width: 80,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),

              // Payment Instructions
              const Text(
                "MPESA Checkout sent to +254701176895",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Payment Alert",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Follow the instructions below:",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InstructionText("✔ Check on a payment pop-up on your phone.",
                      isBold: true),
                  InstructionText("✔ Input your MPESA PIN and click OK."),
                  InstructionText(
                      "✔ An MPESA confirmation SMS will be sent to you."),
                ],
              ),
              const SizedBox(height: 20),

              // Confirm Payment Button
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => PaymentConfirmationScreen(
                          product: product, locationName: locationName)));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                ),
                child: const Text("Confirm Payment",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
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
                Center(
                  child: Text(
                    "Summary",
                    style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "${product.name}, $locationName",
                      style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Form fields
                buildInputField("Name"),
                buildInputField("Date & Time"),
                buildInputField("No. of tickets"),
                buildInputField("Total Hours"),

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
                      Text("KES 20,000.00",
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

                // Payment Options
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    paymentButton(
                        "Mpesa", Colors.green, Colors.white, screenWidth),
                    paymentButton(
                        "Card", Colors.grey, Colors.black, screenWidth),
                    paymentButton(
                        "Bank", Colors.grey, Colors.black, screenWidth),
                    paymentButton(
                        "GPay", Colors.orange, Colors.black, screenWidth),
                  ],
                ),

                SizedBox(height: screenHeight * 0.02),

                // Mpesa Mobile Number Input
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                      vertical: screenHeight * 0.015),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.orange),
                      SizedBox(width: screenWidth * 0.02),
                      const Expanded(
                          child: Text("M-Pesa Mobile No",
                              style: TextStyle(color: Colors.grey))),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                // Complete Payment Button
                Center(
                  child: ElevatedButton(
                    onPressed: () => showMpesaModal(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.015,
                          horizontal: screenWidth * 0.2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text("Complete payment",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.045)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to build input fields
  Widget buildInputField(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange)),
        ),
      ),
    );
  }

  // Payment Button Widget
  Widget paymentButton(
      String text, Color bgColor, Color textColor, double screenWidth) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.02, horizontal: screenWidth * 0.05),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
    );
  }
}
