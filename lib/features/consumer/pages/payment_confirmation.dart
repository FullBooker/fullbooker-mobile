import 'package:flutter/material.dart';
import 'package:fullbooker/features/consumer/painters.dart';
import 'package:fullbooker/features/consumer/widgets/tickets_summary.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  final Product product;
  final String locationName;
  final Ticket ticket;

  const PaymentConfirmationScreen(
      {super.key,
      required this.product,
      required this.locationName,
      required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          const StandardNavBar(showSearchBar: false, iconsColor: Colors.black),
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
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(0),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300)),
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
            Text.rich(
              TextSpan(
                text: "Download ",
                style: const TextStyle(fontSize: 14),
                children: [
                  const TextSpan(
                    text: "your ticket below ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text: "or check your email at ",
                  ),
                  TextSpan(
                    text: ticket.email,
                    style: const TextStyle(fontWeight: FontWeight.bold),
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
                backgroundColor: const Color(0xf0F55E00),
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
      width: 360,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(2, 2)),
        ],
      ),
      child: Row(
        children: [
          // Right Label "REGULAR"
          Container(
            width: 24,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: const Center(
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  "FullBooker",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // Left Section (QR Code & User Info)
          Container(
            width: 100,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  "Name: ${ticket.name}\nID: ${ticket.id}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 10),
                ),
                const SizedBox(height: 8),
                QrImageView(
                  data: "FB25/01/001Rt",
                  version: QrVersions.auto,
                  size: 80,
                ),
                const SizedBox(height: 5)
              ],
            ),
          ),

          SizedBox(
            width: 10,
            child: CustomPaint(
              size: const Size(1.5, 140),
              painter: DashedLinePainter(),
            ),
          ),

          // Right Section (Event Info)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    "Confirmation Number: FB25/01/001Rt",
                    style: TextStyle(fontSize: 11),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Name: ${ticket.name}",
                    style: const TextStyle(fontSize: 11),
                  ),
                  Text(
                    "ID: ${ticket.id}",
                    style: const TextStyle(fontSize: 11),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    "Location: $locationName",
                    style: const TextStyle(fontSize: 11),
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "19TH February",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "5PM - 1AM",
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Emergency contact",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "+254701176895",
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Right Label "REGULAR"
          Container(
            width: 24,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: const Center(
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  "REGULAR",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
