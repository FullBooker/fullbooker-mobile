import 'package:flutter/material.dart';
import 'package:fullbooker/features/host/models/product.dart';

class TicketBookingWidget extends StatefulWidget {
  final Product product;

  const TicketBookingWidget({super.key, required this.product});

  @override
  State createState() => _TicketBookingWidgetState();
}

class _TicketBookingWidgetState extends State<TicketBookingWidget> {
  int selectedTickets = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            widget.product.pricing.length, (index) => TicketForm(index: index)),
      ),
    );
  }
}

class TicketForm extends StatelessWidget {
  final int index;

  const TicketForm({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            buildTextField(Icons.person, "Name"),
            buildTextField(Icons.credit_card, "ID/ Passport Number"),
            buildTextField(Icons.phone, "Phone Number"),
            buildTextField(Icons.email, "Email"),
            buildTextField(Icons.numbers, "Number of tickets",
                controller: TextEditingController(text: "1"))
          ],
        ),
      ),
    );
  }

  Widget buildTextField(IconData icon, String hint,
      {TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
