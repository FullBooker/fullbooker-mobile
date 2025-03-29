import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/features/host/models/old_product.dart';
import 'package:fullbooker/shared/widgets/old_buttons.dart';

class CheckoutCard extends StatelessWidget {
  final ProductPricing? pricing;
  final int quantity;
  final String locationName;
  final VoidCallback onProceedClick;

  const CheckoutCard({
    super.key,
    this.pricing,
    required this.quantity,
    required this.locationName,
    required this.onProceedClick,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.05), // Dynamic padding
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 30,
                color: Colors.black.withValues(alpha: .1),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                  child: Image.asset(logoSplashImagePath),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Number of Tickets
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      noOfTickets,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Text(
                    quantity.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.015),

              // Ticket Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      softWrap: true,
                      ticketPriceString,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      pricing == null || quantity == 0
                          ? '_'
                          : 'KES ${pricing!.cost}  X  $quantity',
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.025),

              // Total Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    totalString,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        softWrap: true,
                        quantity > 0 && pricing != null
                            ? 'KES ${pricing!.cost * quantity}'
                            : '_',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),

              Center(
                child: OldButton(
                  onProceedClick,
                  actionLabel: proceedToCheckoutString,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
