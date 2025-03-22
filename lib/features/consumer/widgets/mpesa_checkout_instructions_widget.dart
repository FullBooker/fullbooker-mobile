import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
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
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          smallVerticalSizedBox,
          Text(
            paymentAlert,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          smallVerticalSizedBox,
          Text(
            followInstructions,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          smallVerticalSizedBox,
          Text(
            paymentInstructions,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          _buildBulletPoint(
            checkPopup,
            context,
            isBold: true,
          ),
          _buildBulletPoint(inputMpesaPIN, context, isBold: true),
          _buildBulletPoint(mpesaConfirmation, context, isBold: true),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(
    String text,
    BuildContext context, {
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('• ', style: Theme.of(context).textTheme.bodyLarge),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
