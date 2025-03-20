// Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_bar_action.dart';
import 'package:fullbooker/presentation/core/components/notification_bell.dart';

// Package imports:
import 'package:heroicons/heroicons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.onLeadingTap,
    this.actions = const <AppBarAction>[],
    this.showBell = true,
    this.bodyWidget,
    this.leadingKey,
    this.preferredSize = const Size.fromHeight(60),
  });

  final String? title;
  final Widget? leading;
  final Function()? onLeadingTap;
  final List<AppBarAction>? actions;
  final bool showBell;
  final Widget? bodyWidget;
  final Key? leadingKey;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  key: action.actionKey,
                  borderRadius: BorderRadius.circular(8),
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
          ),
        if (showBell) const NotificationBell(),
      ],
    );
  }
}
