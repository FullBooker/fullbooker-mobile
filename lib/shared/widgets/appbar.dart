import 'package:flutter/material.dart';

enum ProductSteps { Overview, Products, Sales, Expenses, Goals }

class ProductSetupNavBar extends StatelessWidget
    implements PreferredSizeWidget {
  final ProductSteps step;
  final Widget? leading;
  final Widget? title;
  final double height;
  final Function()? onMenuClicked;

  const ProductSetupNavBar(
      {super.key,
      this.onMenuClicked,
      this.step = ProductSteps.Overview,
      this.leading = const SizedBox(),
      this.height = 50,
      this.title});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      leadingWidth: 0,
      backgroundColor: const Color(0xf0191919),
      toolbarHeight: height,
      title: Row(
        children: [
          for (var value in ProductSteps.values)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: Text(value.name,
                  style: TextStyle(
                      shadows: const [
                        Shadow(color: Colors.white, offset: Offset(0, -5))
                      ],
                      fontSize: 14,
                      color: Colors.transparent,
                      decoration: value == step
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      decorationColor: const Color(0xf0F55E00),
                      decorationThickness: 2)),
            ),
        ],
      ),
      actions: const [
        Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(Icons.menu, color: Colors.white))
      ],
    );
  }
}
