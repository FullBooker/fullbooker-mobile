import 'package:flutter/material.dart';
import 'package:fullbooker/features/host/models/product.dart';

class CheckoutCard extends StatelessWidget {
  final ProductPricing? pricing;
  final int quantity;
  final String locationName;
  final VoidCallback onProceedClick;

  const CheckoutCard(
      {super.key,
      this.pricing,
      required this.quantity,
      required this.locationName,
      required this.onProceedClick});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.05), // Dynamic padding
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                child: Image.asset("assets/logo_splash.png"),
              )),

              SizedBox(height: screenHeight * 0.02),

              // Number of Tickets
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Number of tickets",
                    style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.015),

              // Ticket Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ticket Price",
                    style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    pricing == null || quantity == 0
                        ? "_"
                        : "KES ${pricing!.cost}  X  $quantity",
                    style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.025),

              // Total Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        softWrap: true,
                        quantity > 0 && pricing != null
                            ? "KES ${pricing!.cost * quantity}"
                            : "_",
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),

              Center(
                child: ElevatedButton(
                  onPressed: onProceedClick,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xf0F55E00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.2,
                    ),
                  ),
                  child: Text(
                    "Proceed to Checkout",
                    style: TextStyle(
                        color: Colors.white, fontSize: screenWidth * 0.045),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
