import 'package:flutter/material.dart';
import 'package:fullbooker/shared/widgets/divider.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final String pageDescription;
  final bool withLogo;
  final double widthFactor;
  final double pageDescriptionPadding;
  final double pageDescriptionTopPadding;
  final double headerPadding;
  final double headerTopPadding;
  final double pageTitleBottomPadding;
  final double pageDescriptionFontSize;
  final double pageHeaderFontSize;

  const PageHeader(this.title, this.pageDescription,
      {super.key,
      this.withLogo = true,
      this.widthFactor = 0.6,
      this.headerPadding = 30,
      this.headerTopPadding = 10,
      this.pageTitleBottomPadding = 8,
      this.pageDescriptionPadding = 15,
      this.pageDescriptionFontSize = 16,
      this.pageDescriptionTopPadding = 10,
      this.pageHeaderFontSize = 16});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: headerPadding, top: headerTopPadding),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(bottom: pageTitleBottomPadding),
          child: Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: pageHeaderFontSize)),
        ),
        withLogo
            ? const SizedBox(
                height: 64,
                child: Image(image: AssetImage("assets/logo_splash.png")))
            : const SizedBox(),
        Padding(
            padding: EdgeInsets.only(
                bottom: pageDescriptionPadding, top: pageDescriptionTopPadding),
            child: Text(pageDescription,
                style: TextStyle(fontSize: pageDescriptionFontSize),
                textAlign: TextAlign.center)),
        SizedBox(
            width: MediaQuery.of(context).size.width * widthFactor,
            child: const RoundedDivider(height: 2, color: Color(0xf0AE4808)))
      ]),
    );
  }
}
