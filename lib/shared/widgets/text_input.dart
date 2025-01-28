import 'package:flutter/material.dart';

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
