import 'package:flutter/material.dart';
import 'package:fullbooker/shared/entities/ticket.dart';

class MpesaCheckoutInstructionsWidget extends StatelessWidget {
  final Ticket ticket;

  const MpesaCheckoutInstructionsWidget({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'MPESA Checkout sent to ${ticket.phone}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Payment Alert',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Follow the instructions below:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            'Instructions to Pay:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildBulletPoint(
            'Check on a payment pop-up on your phone.',
            isBold: true,
          ),
          _buildBulletPoint('Input your MPESA PIN and click OK.', isBold: true),
          _buildBulletPoint(
            'An MPESA confirmation SMS will be sent to you.',
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('• ', style: TextStyle(fontSize: 16)),
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
