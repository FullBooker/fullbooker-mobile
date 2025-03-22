import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// TODO(abiud): remove this
class StandardTextInput extends StatefulWidget {
  final String label;
  final IconData? labelPrefix;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isOptional;
  final int? maxLength;
  final List<TextInputFormatter>? formatters;

  const StandardTextInput(
    this.label, {
    super.key,
    this.labelPrefix,
    this.validator,
    this.controller,
    this.maxLength,
    this.formatters,
    this.isPassword = false,
    this.isOptional = false,
  });

  @override
  State<StatefulWidget> createState() => StandardTextInputState();
}

class StandardTextInputState extends State<StandardTextInput> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: TextFormField(
        maxLength: widget.maxLength,
        obscureText: !_passwordVisible && widget.isPassword,
        validator: widget.validator,
        controller: widget.controller,
        inputFormatters: widget.formatters,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.labelPrefix, color: Colors.black),
          hintText: widget.label,
          filled: true,
          fillColor: const Color(0xf0F5F4F4),
          counter: const SizedBox(),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    // Update the state i.e. toggle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                )
              : null,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
        ),
      ),
    );
  }
}

class SimpleTextInput extends StatelessWidget {
  final String? hintText;
  final Widget? leading;
  final TextEditingController controller;

  const SimpleTextInput({
    super.key,
    required this.controller,
    this.hintText,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: leading != null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: leading,
              )
            : null,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.only(bottom: 12, left: 10),
      ),
    );
  }
}

class SimpleDoubleInput extends StatelessWidget {
  final String? hintText;
  final Widget? leading;
  final TextEditingController controller;
  final Color fontColor;

  const SimpleDoubleInput({
    super.key,
    required this.controller,
    this.hintText,
    this.leading,
    this.fontColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)')),
      ],
      decoration: InputDecoration(
        prefixIcon: leading != null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: leading,
              )
            : null,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.only(bottom: 12, left: 10),
      ),
    );
  }
}

class SimpleIntInput extends StatelessWidget {
  final String? hintText;
  final Widget? leading;
  final TextEditingController controller;

  const SimpleIntInput({
    super.key,
    required this.controller,
    this.hintText,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'(^\d*)')),
      ],
      decoration: InputDecoration(
        prefixIcon: leading != null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: leading,
              )
            : null,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.only(bottom: 12, left: 10),
      ),
    );
  }
}
