import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/host/models/old_product.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/ticket.dart';
import 'package:fullbooker/shared/validators.dart';

class TicketFormWidget extends StatefulWidget {
  final OldProduct product;
  final String productLocationName;
  final int index;
  final bool withIndexLabel;
  final bool withAddTicketOption;
  final BookingMode bookingMode;
  final Function(Ticket)? onAddClicked;

  const TicketFormWidget({
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
  State<StatefulWidget> createState() => _TicketFormWidgetState();
}

class _TicketFormWidgetState extends State<TicketFormWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ProductPricing? selectedPricing;

  String? nullCheckValidator(String? fieldValue, {bool required = false}) {
    if ((fieldValue == null || fieldValue.isEmpty) && required) {
      return thisFieldIsRequired;
    }
    return null;
  }

  void onAddClicked() {
    if (_formKey.currentState!.validate()) {
      if (selectedPricing == null) {
        showSnackBar(selectPricingTierPrompt, context);
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
                ticketNumber(widget.index + 1),
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge,
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
                      quantityString,
                      controller: numberController,
                      required: true,
                    )
                  else
                    const SizedBox(),
                  // buildTextField(
                  //   Icons.person,
                  //   nameString,
                  //   controller: nameController,
                  //   validator: validateName,
                  // ),
                  buildTextField(
                    Icons.credit_card,
                    idNumber,
                    controller: idController,
                    required: true,
                  ),
                  buildTextField(
                    Icons.phone,
                    phonNumberString,
                    controller: phoneController,
                    validator: validatePhoneNumber,
                  ),
                  buildTextField(
                    Icons.email,
                    emailAddressString,
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
                                          ? addMoreTicketsString
                                          : saveString,
                                      softWrap: true,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.add,
                                  color: Theme.of(context).primaryColor,
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
        isExpanded: true,
        hint: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            pricingTier,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        validator: (ProductPricing? value) {
          if (value == null) return selectPricingTierPrompt;
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
              fit: BoxFit.scaleDown,
              child: Text(
                '${pricing.ticketTier} - KES ${pricing.cost}',
                overflow: TextOverflow.ellipsis,
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
