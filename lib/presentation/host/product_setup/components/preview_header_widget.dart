import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';
import 'package:dartz/dartz.dart' as d;

class PreviewHeaderWidget extends StatelessWidget {
  const PreviewHeaderWidget({
    super.key,
    required this.title,
    required this.copy,
    required this.onEdit,
  });

  final String title;
  final String copy;
  final Function() onEdit;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                copy,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        Expanded(
          child: SecondaryButton(
            customHeight: 32,
            onPressed: () {
              context.router.maybePop();
            },
            child: d.left(
              Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HeroIcon(
                    HeroIcons.pencil,
                    size: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(
                    editString,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
