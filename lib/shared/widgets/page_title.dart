import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
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

  const PageHeader(
    this.title,
    this.pageDescription, {
    super.key,
    this.withLogo = true,
    this.widthFactor = 0.6,
    this.headerPadding = 30,
    this.headerTopPadding = 10,
    this.pageTitleBottomPadding = 8,
    this.pageDescriptionPadding = 15,
    this.pageDescriptionFontSize = 16,
    this.pageDescriptionTopPadding = 10,
    this.pageHeaderFontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: headerPadding, top: headerTopPadding),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: pageTitleBottomPadding),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: pageHeaderFontSize,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          if (withLogo)
            const SizedBox(
              height: 64,
              child: Image(image: AssetImage(logoSplashImagePath)),
            )
          else
            const SizedBox(),
          Padding(
            padding: EdgeInsets.only(
              bottom: pageDescriptionPadding,
              top: pageDescriptionTopPadding,
            ),
            child: Text(
              pageDescription,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: pageDescriptionFontSize),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * widthFactor,
            child: RoundedDivider(
              height: 2,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
