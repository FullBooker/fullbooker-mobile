import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';

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

class StandardNavBar extends StatelessWidget {
  const StandardNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return AppBar(
        toolbarHeight: height * 0.1,
        backgroundColor: Colors.transparent,
        title: DecoratedBox(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                    width: 10,
                    height: 50,
                    child: Center(
                        child: Icon(Icons.search, color: Color(0xf0808080)))),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                      height: 50,
                      child: TextField(
                          decoration: InputDecoration(
                              filled: false,
                              border: InputBorder.none,
                              hintText: "Search for activities and events",
                              hintStyle: TextStyle(
                                  fontSize: ScaleSize.textScaleFactor(context,
                                      maxTextScaleFactor: 48),
                                  color: const Color(0xf0808080))))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                    child: const Icon(Icons.app_registration_rounded,
                        color: Color(0xf0808080))),
              )
            ],
          ),
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(Icons.menu, color: Colors.white, size: 36))
        ]);
  }
}
