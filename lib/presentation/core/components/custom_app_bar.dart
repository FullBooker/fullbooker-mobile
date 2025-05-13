// Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_bar_action.dart';

// Package imports:
import 'package:heroicons/heroicons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.onLeadingTap,
    this.actions = const <AppBarAction>[],
    this.showBell = false,
    this.bodyWidget,
    this.leadingKey,
    this.preferredSize = const Size.fromHeight(60),
    this.centerTile = true,
  });

  final Function()? onLeadingTap;
  final List<AppBarAction>? actions;
  final Widget? bodyWidget;
  final Widget? leading;
  final Key? leadingKey;
  final bool showBell;
  final String? title;

  final bool? centerTile;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8),
        child: AppBar(
          centerTitle: centerTile,
          elevation: 0,
          titleSpacing: 4,
          leading: leading ??
              InkWell(
                key: leadingKey,
                borderRadius: BorderRadius.circular(8),
                splashColor:
                    Theme.of(context).colorScheme.primary.withValues(alpha: .2),
                onTap: () => onLeadingTap?.call() ?? context.router.maybePop(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(12),
                  child: HeroIcon(
                    HeroIcons.arrowLeft,
                    size: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
          title: bodyWidget ??
              Center(
                child: Text(
                  title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
          actions: <Widget>[
            if (actions?.isNotEmpty ?? false)
              ...actions!.map(
                (AppBarAction action) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    key: action.actionKey,
                    splashColor: Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: .2),
                    onTap: action.onTap,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: HeroIcon(
                        action.iconUrl,
                        color: Theme.of(context).primaryColor,
                        size: action.iconSize ?? 24,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
