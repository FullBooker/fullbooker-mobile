import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final Color color;

  const Button(this.child, this.onPressed,
      {super.key, this.color = const Color(0xfff55E00)});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: FilledButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) => color,
              ),
              minimumSize: const WidgetStatePropertyAll(Size.fromHeight(30)),
              padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 10, horizontal: 0)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
          onPressed: onPressed,
          child: FractionallySizedBox(
              widthFactor: .5, child: Center(child: child)),
        ));
  }
}
