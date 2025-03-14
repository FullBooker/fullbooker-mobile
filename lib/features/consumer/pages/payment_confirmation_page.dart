import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/features/consumer/painters.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/entities/ticket.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:fullbooker/shared/widgets/scale_locked_text.dart';
import 'package:fullbooker/shared/widgets/standard_nav_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';

@RoutePage()
class PaymentConfirmationPage extends StatelessWidget {
  final Product product;
  final String locationName;
  final Ticket ticket;

  const PaymentConfirmationPage({
    super.key,
    required this.product,
    required this.locationName,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          const StandardNavBar(showSearchBar: false, iconsColor: Colors.black),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: width * 0.7,
              child: const RoundedDivider(color: Color(0xf0F55E00), height: 2),
            ),
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 10),
            SizedBox(
              width: width * 0.7,
              child: const Text(
                'Thank you for your payment',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            // Payment Details Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(0),
                boxShadow: const <BoxShadow>[
                  BoxShadow(color: Colors.black12, blurRadius: 5),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _paymentDetail(
                    'Payment Confirmation Number',
                    '473FHETGY3HF3',
                  ),
                  _paymentDetail('Payment Amount', 'KES 20,000.00'),
                  _paymentDetail('Payment Date', '19/02/2025'),
                  _paymentDetail('From Mpesa No.', '+254701176895'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(
                child: Text(
                  '${product.name}, $locationName',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Email Info
            Text.rich(
              TextSpan(
                text: 'Download ',
                style: const TextStyle(fontSize: 14),
                children: <InlineSpan>[
                  const TextSpan(
                    text: 'your ticket below ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text: 'or check your email at ',
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
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
              ),
              child: const Text(
                'Download ticket',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
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
        children: <Widget>[
          Flexible(
            child: Text(
              title,
              softWrap: true,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Flexible(
            child: Text(
              value,
              softWrap: true,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  // Ticket Card Widget
  Widget _ticketCard() {
    return Container(
      height: 190,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(2, 2)),
        ],
      ),
      child: Row(
        children: <Widget>[
          // Right Label "REGULAR"
          Container(
            width: 24,
            decoration: BoxDecoration(
              color: Colors.grey[400],
            ),
            child: const Center(
              child: RotatedBox(
                quarterTurns: 3,
                child: ScaleLockedText(
                  'FullBooker',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // Left Section (QR Code & User Info)
          Container(
            width: 100,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ScaleLockedText(
                    product.name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  ScaleLockedText(
                    'Name: ${ticket.name}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 7),
                  ),
                  ScaleLockedText(
                    'ID: ${ticket.id}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 7),
                  ),
                  const SizedBox(height: 8),
                  QrImageView(
                    data: 'FB25/01/001Rt',
                    size: 100,
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),

          SizedBox(
            width: 10,
            child: CustomPaint(
              size: const Size(1.5, 190),
              painter: DashedLinePainter(),
            ),
          ),

          // Right Section (Event Info)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ScaleLockedText(
                        product.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          ScaleLockedText(
                            '19TH',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ScaleLockedText(
                            'February',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ScaleLockedText(
                            '5PM - 1AM',
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const ScaleLockedText(
                    'Confirmation Number:',
                    style: TextStyle(fontSize: 11),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const ScaleLockedText(
                    'FB25/01/001Rt',
                    style: TextStyle(fontSize: 11),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  ScaleLockedText(
                    'Name: ${ticket.name}',
                    style: const TextStyle(fontSize: 11),
                  ),
                  ScaleLockedText(
                    'ID: ${ticket.id}',
                    style: const TextStyle(fontSize: 11),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        // Allows the text to wrap properly
                        child: ScaleLockedText(
                          'Location: $locationName',
                          style: const TextStyle(fontSize: 11),
                          softWrap: true,
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          ScaleLockedText(
                            'Emergency contact',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ScaleLockedText(
                            '+254701176895',
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
            ),
            child: const Center(
              child: RotatedBox(
                quarterTurns: 3,
                child: ScaleLockedText(
                  'REGULAR',
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
