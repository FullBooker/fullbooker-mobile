import 'package:flutter/material.dart';
import 'package:fullbooker/features/auth/pages/login.dart';
import 'package:fullbooker/features/consumer/pages/landing.dart';
import 'package:fullbooker/features/host/pages/summary.dart';

// ignore: constant_identifier_names
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

  void goToLogin(BuildContext context) {
    return WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const Login()));
    });
  }

  void goToConsumer(BuildContext context) {
    return WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const Landing()));
    });
  }

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
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 5),
            child: PopupMenuButton(
                color: Colors.white,
                child: const Icon(Icons.menu, color: Colors.white, size: 36),
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<Widget>>[
                    PopupMenuItem<Widget>(
                        onTap: () => goToLogin(context),
                        child: const Row(children: [
                          Icon(Icons.person, color: Color(0xf0FC8135)),
                          Text("Log out")
                        ])),
                    PopupMenuItem<Widget>(
                        onTap: () => goToConsumer(context),
                        child: const Row(children: [
                          Icon(Icons.home, color: Color(0xf0FC8135)),
                          Text("Buy A Ticket")
                        ]))
                  ];
                }))
      ],
    );
  }
}

class StandardNavBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showSearchBar;
  final Color iconsColor;
  final double height;

  const StandardNavBar(
      {super.key,
      this.showSearchBar = true,
      this.iconsColor = Colors.white,
      this.height = 60});

  @override
  Size get preferredSize => Size.fromHeight(height);

  void goToLogin(BuildContext context) {
    return WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const Login()));
    });
  }

  void goToHosting(BuildContext context) {
    return WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const EventsSummary()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return AppBar(
        toolbarHeight: height * 0.1,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: iconsColor),
        title: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black45),
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: showSearchBar
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: SizedBox(
                            height: 50,
                            child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    filled: false,
                                    border: InputBorder.none,
                                    hintText:
                                        "Search for activities and events",
                                    hintStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xf0808080))))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                          child: const Icon(Icons.app_registration_rounded,
                              color: Color(0xf0808080))),
                    )
                  ],
                )
              : const SizedBox(),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 5),
              child: PopupMenuButton(
                  color: Colors.white,
                  child: Icon(Icons.menu, color: iconsColor, size: 64),
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<Widget>>[
                      PopupMenuItem<Widget>(
                          onTap: () => goToLogin(context),
                          child: const Row(children: [
                            Icon(Icons.person, color: Color(0xf0FC8135)),
                            Text("Log out")
                          ])),
                      PopupMenuItem<Widget>(
                          onTap: () => goToHosting(context),
                          child: const Row(children: [
                            Icon(Icons.home, color: Color(0xf0FC8135)),
                            Text("Switch to hosting")
                          ]))
                    ];
                  }))
        ]);
  }
}
