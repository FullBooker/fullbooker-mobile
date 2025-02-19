import 'package:flutter/material.dart';
import 'package:fullbooker/features/host/models/product.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  final Product product;
  final String locationName;

  const PaymentConfirmationScreen(
      {super.key, required this.product, required this.locationName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.menu, size: 28),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Checkmark Icon
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 10),

            // Confirmation Message
            const Text(
              "Thank you for your payment",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Payment Details Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 5)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _paymentDetail(
                      "Payment Confirmation Number", "473FHETGY3HF3"),
                  _paymentDetail("Payment Amount", "KES 20,000.00"),
                  _paymentDetail("Payment Date", "19/02/2025"),
                  _paymentDetail("From Mpesa No.", "+254701176895"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "${product.name}, $locationName",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Email Info
            const Text.rich(
              TextSpan(
                text: "Download ",
                style: TextStyle(fontSize: 14),
                children: [
                  TextSpan(
                    text: "your ticket below ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "or check your email at ",
                  ),
                  TextSpan(
                    text: "kel*****ena@gmail.com",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // Ticket Card
            _ticketCard(),

            const SizedBox(height: 20),

            // Download Ticket Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
              ),
              child: const Text("Download ticket",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create payment detail rows
  Widget _paymentDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  // Ticket Card Widget
  Widget _ticketCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        children: [
          // Ticket Header
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Rock Concert",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text("19TH February",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(),

          // Ticket Details
          Row(
            children: [
              // QR Code Placeholder
              Container(
                width: 60,
                height: 60,
                color: Colors.black12,
                child:
                    const Icon(Icons.qr_code, size: 40, color: Colors.black54),
              ),
              const SizedBox(width: 10),

              // Ticket Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Confirmation Number: FB25/01/001Rt",
                        style: TextStyle(fontSize: 14)),
                    const Text("Name: Kelvin Kinoti Laichena",
                        style: TextStyle(fontSize: 14)),
                    const Text("ID: 35617888", style: TextStyle(fontSize: 14)),
                    Text(locationName, style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          const Text("Emergency contact: +254701176895",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}
