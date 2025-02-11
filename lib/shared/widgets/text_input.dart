import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StandardTextInput extends StatefulWidget {
  final String label;
  final IconData? labelPrefix;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isOptional;

  const StandardTextInput(this.label,
      {super.key,
      this.labelPrefix,
      this.validator,
      this.controller,
      this.isPassword = false,
      this.isOptional = false});

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
          obscureText: !_passwordVisible && widget.isPassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.labelPrefix),
            hintText: widget.label,
            hintStyle: const TextStyle(color: Color.fromARGB(255, 65, 65, 65)),
            filled: true,
            fillColor: const Color(0xf0F5F4F4),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  )
                : null,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide.none),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Color(0xfff55E00), width: 2)),
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Color(0xfff55E00), width: 2)),
          ),
        ));
  }
}

class SimpleTextInput extends StatelessWidget {
  final String? hintText;
  final Widget? leading;
  final TextEditingController controller;

  const SimpleTextInput(
      {super.key, required this.controller, this.hintText, this.leading});

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
            contentPadding: const EdgeInsets.only(bottom: 12, left: 10)));
  }
}

class SimpleDoubleInput extends StatelessWidget {
  final String? hintText;
  final Widget? leading;
  final TextEditingController controller;
  final Color fontColor;

  const SimpleDoubleInput(
      {super.key,
      required this.controller,
      this.hintText,
      this.leading,
      this.fontColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
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
            contentPadding: const EdgeInsets.only(bottom: 12, left: 10)));
  }
}

class SimpleIntInput extends StatelessWidget {
  final String? hintText;
  final Widget? leading;
  final TextEditingController controller;

  const SimpleIntInput(
      {super.key, required this.controller, this.hintText, this.leading});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: false),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^\d*)'))],
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
            contentPadding: const EdgeInsets.only(bottom: 12, left: 10)));
  }
}
