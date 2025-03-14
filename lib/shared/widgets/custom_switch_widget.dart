import 'package:flutter/material.dart';

class CustomSwitchWidget extends StatefulWidget {
  final Function(bool)? onValueChanged;

  const CustomSwitchWidget({super.key, this.onValueChanged});

  @override
  State<StatefulWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          isSwitchOn ? 'Yes' : 'No',
          style: const TextStyle(fontSize: 18),
        ),
        Switch(
          value: isSwitchOn,
          onChanged: (bool value) {
            setState(() {
              isSwitchOn = value;
              if (widget.onValueChanged != null) widget.onValueChanged!(value);
            });
          },
        ),
      ],
    );
  }
}
