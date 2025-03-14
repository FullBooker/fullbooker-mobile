import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/features/auth/pages/login_page.dart';
import 'package:fullbooker/features/consumer/pages/consumer_landing_page.dart';
import 'package:fullbooker/shared/entities/enums.dart';

class ProductSetupNavBar extends StatelessWidget
    implements PreferredSizeWidget {
  final ProductSteps step;
  final Widget? leading;
  final Widget? title;
  final double height;
  final Function()? onMenuClicked;

  const ProductSetupNavBar({
    super.key,
    this.onMenuClicked,
    this.step = ProductSteps.Overview,
    this.leading = const SizedBox(),
    this.height = 50,
    this.title,
  });

  void goToLogin(BuildContext context) {
    return WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<LoginPage>(builder: (_) => const LoginPage()),
      );
    });
  }

  void goToConsumer(BuildContext context) {
    return WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(
        MaterialPageRoute<ConsumerLandingPage>(
          builder: (_) => const ConsumerLandingPage(),
        ),
      );
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
      title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            for (ProductSteps value in ProductSteps.values)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                child: Text(
                  value.name,
                  style: TextStyle(
                    shadows: const <Shadow>[
                      Shadow(color: Colors.white, offset: Offset(0, -5)),
                    ],
                    fontSize: 14,
                    color: Colors.transparent,
                    decoration: value == step
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    decorationColor: AppColors.primaryColor,
                    decorationThickness: 2,
                  ),
                ),
              ),
          ],
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: PopupMenuButton<dynamic>(
            color: Colors.white,
            child: const Icon(Icons.menu, color: Colors.white, size: 36),
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<Widget>>[
                PopupMenuItem<Widget>(
                  onTap: () => goToLogin(context),
                  child: const Row(
                    children: <Widget>[
                      Icon(Icons.person, color: Color(0xf0FC8135)),
                      Text('Log out'),
                    ],
                  ),
                ),
                PopupMenuItem<Widget>(
                  onTap: () => goToConsumer(context),
                  child: const Row(
                    children: <Widget>[
                      Icon(Icons.home, color: Color(0xf0FC8135)),
                      Text('Buy A Ticket'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ),
      ],
    );
  }
}
