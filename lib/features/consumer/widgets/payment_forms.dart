import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
import 'package:fullbooker/shared/entities/spaces.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key, this.onCompleteClick});

  final VoidCallback? onCompleteClick;

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  String selectedMethod = 'Mpesa';

  Widget _buildPaymentOptions() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: paymentMethods.map((Map<String, dynamic> method) {
          final bool isSelected = selectedMethod == method['id'];
          final bool isApplePay = method['isApplePay'];
          final IconData? icon = method['icon'];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedMethod = method['id'];
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: isSelected ? method['color'] : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isApplePay ? Colors.black : Colors.grey.shade200,
                  width: isApplePay ? 4 : 1.5,
                ),
              ),
              child: Row(
                children: <Widget>[
                  if (isApplePay) const Icon(Icons.apple, color: Colors.black),
                  if (icon != null) Icon(icon, color: Colors.black),
                  Text(
                    method['name'],
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
      case 'Mpesa':
        return _mpesaForm();
      case 'Card':
        return _cardForm();
      case 'Bank':
        return _bankForm();
      case 'Apple Pay':
        return _applePayForm();
      case 'G Pay':
        return _googlePayForm();
      default:
        return const SizedBox();
    }
  }

  // TODO!!(abiud): this is repetitive. Clean it up
  // Updated M-Pesa Form with Better Styling
  Widget _mpesaForm() {
    return Column(
      children: <Widget>[
        _customTextField(
          label: mpesaNo,
          icon: Icons.phone,
          isNumeric: true,
        ),
        const SizedBox(height: 15),
        _styledButton(completePayment, isPrimary: true),
      ],
    );
  }

  Widget _bankForm() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 15),
        _styledButton(completePayment, isPrimary: true),
      ],
    );
  }

  Widget _applePayForm() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 15),
        _styledButton(completePayment, isPrimary: true),
      ],
    );
  }

  Widget _googlePayForm() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 15),
        _styledButton(completePayment, isPrimary: true),
      ],
    );
  }

  Widget _cardForm() {
    return Column(
      children: <Widget>[
        _customTextField(label: cardHolderName, icon: Icons.person),
        smallVerticalSizedBox,
        _customTextField(
          label: cardNumber,
          icon: Icons.credit_card,
          isNumeric: true,
        ),
        smallVerticalSizedBox,
        Row(
          children: <Widget>[
            Expanded(
              child: _customTextField(
                label: expiryDate,
                isNumeric: true,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _customTextField(
                label: cvvString,
                isNumeric: true,
                isCvv: true,
              ),
            ),
          ],
        ),
        smallVerticalSizedBox,
        _customTextField(
          label: billingAddress,
          icon: Icons.location_on,
        ),
        const SizedBox(height: 15),
        _styledButton(completePayment, isPrimary: true),
      ],
    );
  }

  Widget _customTextField({
    required String label,
    IconData? icon,
    bool isNumeric = false,
    bool isCvv = false,
  }) {
    return TextField(
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      obscureText: isCvv,
      inputFormatters: isNumeric
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : <TextInputFormatter>[],
      decoration: InputDecoration(
        filled: false,
        prefixIcon: icon != null ? Icon(icon, color: Colors.orange) : null,
        hintText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
    );
  }

  Widget _styledButton(String text, {bool isPrimary = false}) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: widget.onCompleteClick,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        mediumVerticalSizedBox,
        const Text(
          selectPaymentMethod,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        _buildPaymentOptions(),
        const SizedBox(height: 25),
        _buildPaymentForm(),
      ],
    );
  }
}
