import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/features/consumer/widgets/ticket_booking.dart';
import 'package:fullbooker/features/consumer/widgets/tickets_summary.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/validators.dart';

class TicketForm extends StatefulWidget {
  final Product product;
  final String productLocationName;
  final int index;
  final bool withIndexLabel;
  final bool withAddTicketOption;
  final BookingMode bookingMode;
  final Function(Ticket)? onAddClicked;

  const TicketForm({
    super.key,
    required this.index,
    required this.product,
    required this.productLocationName,
    required this.bookingMode,
    this.withIndexLabel = true,
    this.withAddTicketOption = true,
    this.onAddClicked,
  });

  @override
  State<StatefulWidget> createState() => _TicketFormState();
}

class _TicketFormState extends State<TicketForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ProductPricing? selectedPricing;

  String? nullCheckValidator(String? fieldValue, {bool required = false}) {
    if ((fieldValue == null || fieldValue.isEmpty) && required) {
      return 'This field is required';
    }
    return null;
  }

  void onAddClicked() {
    if (_formKey.currentState!.validate()) {
      if (selectedPricing == null) {
        showSnackBar('Please select a pricing tier for this ticket', context);
        return;
      }
      final int quantity = numberController.text.isEmpty ||
              widget.bookingMode == BookingMode.single
          ? 1
          : int.parse(numberController.text);
      final Ticket ticket = Ticket(
        nameController.text,
        idController.text,
        phoneController.text,
        emailController.text,
        selectedPricing!,
        quantity,
      );
      if (widget.onAddClicked != null) widget.onAddClicked!(ticket);
    }
  }

  void onRemoveClicked() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (widget.withIndexLabel)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ticket ${widget.index + 1}',
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        else
          const SizedBox(),
        Card(
          color: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  buildTicketsDropDown(),
                  if (widget.bookingMode == BookingMode.bulk)
                    buildTextField(
                      Icons.numbers,
                      'Quantity',
                      controller: numberController,
                      required: true,
                    )
                  else
                    const SizedBox(),
                  buildTextField(
                    Icons.person,
                    'Name',
                    controller: nameController,
                    validator: validateName,
                  ),
                  buildTextField(
                    Icons.credit_card,
                    'ID/ Passport Number',
                    controller: idController,
                    required: true,
                  ),
                  buildTextField(
                    Icons.phone,
                    'Phone Number',
                    controller: phoneController,
                    validator: validatePhoneNumber,
                  ),
                  buildTextField(
                    Icons.email,
                    'Email',
                    controller: emailController,
                    validator: validateEmail,
                  ),
                  GestureDetector(
                    onTap: onAddClicked,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Text(
                                      widget.bookingMode == BookingMode.single
                                          ? 'Add More Tickets'
                                          : 'Save',
                                      softWrap: true,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.add,
                                  color: Color(0xf0FC8135),
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTicketsDropDown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownButtonFormField<ProductPricing>(
        value: selectedPricing,
        isExpanded: true, // Ensure dropdown expands to available width
        hint: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Pricing Tier',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        validator: (ProductPricing? value) {
          if (value == null) return 'Please select a pricing tier';
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.price_change, color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        items: widget.product.pricing.map((ProductPricing pricing) {
          return DropdownMenuItem<ProductPricing>(
            value: pricing,
            child: FittedBox(
              fit: BoxFit.scaleDown, // Prevents overflow by scaling down text
              child: Text(
                '${pricing.ticketTier} - KES ${pricing.cost}',
                overflow: TextOverflow.ellipsis, // Truncate long text
                maxLines: 1,
              ),
            ),
          );
        }).toList(),
        onChanged: (ProductPricing? val) =>
            setState(() => selectedPricing = val),
      ),
    );
  }

  Widget buildTextField(
    IconData icon,
    String hint, {
    TextEditingController? controller,
    String? Function(String?)? validator,
    bool required = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        validator: validator ??
            (String? val) => nullCheckValidator(val, required: required),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class AmountSelectionDropdown extends StatefulWidget {
  const AmountSelectionDropdown({super.key});

  @override
  State<StatefulWidget> createState() => _AmountSelectionDropdownState();
}

class _AmountSelectionDropdownState extends State<AmountSelectionDropdown> {
  int selectedTickets = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xf0FADFCF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Label
            Text(
              'Select number of tickets',
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),

            // Dropdown Button
            DropdownButton<int>(
              value: selectedTickets,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
              underline: const SizedBox(),
              // TODO(abiud): investigate this and fix
              // ignore: always_specify_types
              items: List.generate(11, (int index) => index).map((int number) {
                return DropdownMenuItem<int>(
                  value: number,
                  child: Text(
                    number.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              onChanged: (int? value) {
                setState(() {
                  selectedTickets = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
