import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';

class StandardNavBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showSearchBar;
  final Color iconsColor;
  final double height;
  final String? pageTitle;
  final bool showRightAction;
  final double tileFontSize;
  final FontWeight titleFontWeight;
  final Color backgroundColor;

  const StandardNavBar({
    super.key,
    this.showSearchBar = true,
    this.iconsColor = Colors.white,
    this.height = 60,
    this.showRightAction = true,
    this.pageTitle,
    this.tileFontSize = 14,
    this.titleFontWeight = FontWeight.normal,
    this.backgroundColor = Colors.white,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return AppBar(
      toolbarHeight: height * 0.1,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: iconsColor),
      centerTitle: true,
      leading: const Icon(Icons.arrow_back_ios_new),
      title: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: showSearchBar
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: false,
                            border: InputBorder.none,
                            hintText: 'Search for activities and events',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Color(0xf0808080),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      child: Image.asset(filterIconPath),
                    ),
                  ),
                ],
              )
            : pageTitle != null
                ? DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Text(
                        pageTitle!,
                        style: TextStyle(
                          fontSize: tileFontSize,
                          fontWeight: titleFontWeight,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
      ),
      actions: <Widget>[
        if (showRightAction)
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: PopupMenuButton<dynamic>(
              color: Colors.white,
              child: Transform.scale(
                scaleX: .7,
                child: Icon(Icons.menu, color: iconsColor, size: 60),
              ),
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<Widget>>[
                  PopupMenuItem<Widget>(
                    onTap: () => context.router.replace(LoginRoute()),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text('Log out'),
                      ],
                    ),
                  ),
                  PopupMenuItem<Widget>(
                    onTap: () => context.router.push(EventsSummaryRoute()),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.home, color: Theme.of(context).primaryColor),
                        Text('Switch to hosting'),
                      ],
                    ),
                  ),
                ];
              },
            ),
          )
        else
          const SizedBox(),
      ],
    );
  }
}
