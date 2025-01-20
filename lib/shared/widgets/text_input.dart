import 'package:flutter/material.dart';

class StandardTextInput extends StatefulWidget {
  final String label;
  final IconData? labelPrefix;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const StandardTextInput(this.label,
      {super.key,
      this.labelPrefix,
      this.validator,
      this.controller,
      this.isPassword = false});

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
    return TextFormField(
        obscureText: !_passwordVisible && widget.isPassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
          label: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(widget.labelPrefix,
                        color: const Color.fromARGB(255, 65, 65, 65))),
                Text(widget.label,
                    textAlign: TextAlign.left,
                    style:
                        const TextStyle(color: Color.fromARGB(255, 65, 65, 65)))
              ],
            ),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
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
        ));
  }
}
