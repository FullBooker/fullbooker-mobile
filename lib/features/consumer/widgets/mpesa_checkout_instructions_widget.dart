import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
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
            checkoutSentToString(ticket.phone),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            paymentAlert,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            followInstructions,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            paymentInstructions,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildBulletPoint(
            checkPopup,
            isBold: true,
          ),
          _buildBulletPoint(inputMpesaPIN, isBold: true),
          _buildBulletPoint(mpesaConfirmation, isBold: true),
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
