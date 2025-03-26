import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/consumer/painters.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/entities/ticket.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/scale_locked_text.dart';
import 'package:fullbooker/shared/widgets/standard_nav_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:dartz/dartz.dart' as d;

// TODO(abiud): replace the values in this page with mock data for now
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
              child: RoundedDivider(
                color: Theme.of(context).primaryColor,
                height: 2,
              ),
            ),
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            smallVerticalSizedBox,
            SizedBox(
              width: width * 0.7,
              child: Text(
                thankYouForPayment,
                softWrap: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            mediumVerticalSizedBox,

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
                    context,
                  ),
                  _paymentDetail('Payment Amount', 'KES 20,000.00', context),
                  _paymentDetail('Payment Date', '19/02/2025', context),
                  _paymentDetail('From Mpesa No.', '+254701176895', context),
                ],
              ),
            ),
            mediumVerticalSizedBox,

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
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            smallVerticalSizedBox,

            // Email Info
            Text.rich(
              TextSpan(
                text: downloadString,
                style: Theme.of(context).textTheme.bodyMedium,
                children: <InlineSpan>[
                  TextSpan(
                    text: yourTicketBelow,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const TextSpan(
                    text: orCheckEmailText,
                  ),
                  TextSpan(
                    text: ticket.email,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            smallVerticalSizedBox,

            // Ticket Card
            _ticketCard(context),

            mediumVerticalSizedBox,

            // Download Ticket Button
            PrimaryButton(
              onPressed: () {},
              child: d.left(
                Text(
                  downloadTicket,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create payment detail rows
  Widget _paymentDetail(String title, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Text(
              title,
              softWrap: true,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Flexible(
            child: Text(
              value,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  // Ticket Card Widget
  Widget _ticketCard(BuildContext context) {
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
            child: Center(
              child: RotatedBox(
                quarterTurns: 3,
                // TODO(abiud): extract this value from AppConfig
                child: ScaleLockedText(
                  kAppName,
                  style: Theme.of(context).textTheme.bodySmall,
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
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 5),
                  ScaleLockedText(
                    'Name: ${ticket.name}',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  ScaleLockedText(
                    'ID: ${ticket.id}',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodySmall,
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
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          ScaleLockedText(
                            '19TH',
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          ScaleLockedText(
                            'February',
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          ScaleLockedText(
                            '5PM - 1AM',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ScaleLockedText(
                    confirmationNumber,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  ScaleLockedText(
                    'FB25/01/001Rt',
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  ScaleLockedText(
                    'Name: ${ticket.name}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  ScaleLockedText(
                    'ID: ${ticket.id}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        // Allows the text to wrap properly
                        child: ScaleLockedText(
                          'Location: $locationName',
                          style: Theme.of(context).textTheme.bodySmall,
                          softWrap: true,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          ScaleLockedText(
                            'Emergency contact',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          ScaleLockedText(
                            '+254701176895',
                            style: Theme.of(context).textTheme.bodySmall,
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
            child: Center(
              child: RotatedBox(
                quarterTurns: 3,
                child: ScaleLockedText(
                  'REGULAR',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
