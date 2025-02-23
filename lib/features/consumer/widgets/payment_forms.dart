import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentForm extends StatefulWidget {
  final VoidCallback? onCompleteClick;

  const PaymentForm({super.key, this.onCompleteClick});

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  String selectedMethod = "Mpesa"; // Default selected payment method

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          "Select a payment method",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        _buildPaymentOptions(),
        const SizedBox(height: 25),
        _buildPaymentForm(),
      ],
    );
  }

  Widget _buildPaymentOptions() {
    List<Map<String, dynamic>> paymentMethods = [
      {
        "name": "Mpesa",
        "id": "Mpesa",
        "color": Colors.green,
        "isApplePay": false,
        "icon": null
      },
      {
        "name": "Card",
        "id": "Card",
        "color": Colors.green,
        "isApplePay": false,
        "icon": null
      },
      {
        "name": "Bank",
        "id": "Bank",
        "color": Colors.green,
        "isApplePay": false,
        "icon": null
      },
      {
        "name": "Pay",
        "id": "Apple Pay",
        "color": Colors.green,
        "isApplePay": true,
        "icon": null
      },
      {
        "name": "Pay",
        "id": "G Pay",
        "color": Colors.green,
        "isApplePay": false,
        "icon": Icons.g_mobiledata
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: paymentMethods.map((method) {
          bool isSelected = selectedMethod == method["id"];
          bool isApplePay = method["isApplePay"];
          IconData? icon = method["icon"];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedMethod = method["id"];
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: isSelected ? method["color"] : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: isApplePay ? Colors.black : Colors.grey.shade200,
                    width: isApplePay ? 4 : 1.5),
              ),
              child: Row(
                children: [
                  if (isApplePay) const Icon(Icons.apple, color: Colors.black),
                  if (icon != null) Icon(icon, color: Colors.black),
                  Text(
                    method["name"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPaymentForm() {
    switch (selectedMethod) {
      case "Mpesa":
        return _mpesaForm();
      case "Card":
        return _cardForm();
      case "Bank":
        return _bankForm();
      case "Apple Pay":
        return _applePayForm();
      case "G Pay":
        return _googlePayForm();
      default:
        return const SizedBox();
    }
  }

  // Updated M-Pesa Form with Better Styling
  Widget _mpesaForm() {
    return Column(
      children: [
        _customTextField(
          label: "M-Pesa Mobile No",
          icon: Icons.phone,
          isNumeric: true,
        ),
        const SizedBox(height: 15),
        _styledButton("Complete payment", isPrimary: true),
      ],
    );
  }

  Widget _bankForm() {
    return Column(
      children: [
        const SizedBox(height: 15),
        _styledButton("Complete payment", isPrimary: true),
      ],
    );
  }

  Widget _applePayForm() {
    return Column(
      children: [
        const SizedBox(height: 15),
        _styledButton("Complete payment", isPrimary: true),
      ],
    );
  }

  Widget _googlePayForm() {
    return Column(
      children: [
        const SizedBox(height: 15),
        _styledButton("Complete payment", isPrimary: true),
      ],
    );
  }

  Widget _cardForm() {
    return Column(
      children: [
        _customTextField(label: "Cardholder Name", icon: Icons.person),
        const SizedBox(height: 10),
        _customTextField(
            label: "Card Number", icon: Icons.credit_card, isNumeric: true),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
                child: _customTextField(
                    label: "Expiry Date (MM/YY)", isNumeric: true)),
            const SizedBox(width: 10),
            Expanded(
                child: _customTextField(
                    label: "CVV", isNumeric: true, isCvv: true)),
          ],
        ),
        const SizedBox(height: 10),
        _customTextField(
            label: "Billing Address (Optional)", icon: Icons.location_on),
        const SizedBox(height: 15),
        _styledButton("Complete payment", isPrimary: true),
      ],
    );
  }

  Widget _customTextField(
      {required String label,
      IconData? icon,
      bool isNumeric = false,
      bool isCvv = false}) {
    return TextField(
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      obscureText: isCvv,
      inputFormatters:
          isNumeric ? [FilteringTextInputFormatter.digitsOnly] : [],
      decoration: InputDecoration(
          filled: false,
          prefixIcon: icon != null ? Icon(icon, color: Colors.orange) : null,
          hintText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
    );
  }

  Widget _styledButton(String text, {bool isPrimary = false}) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xf0F55E00), // Orange for primary button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: widget.onCompleteClick,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
