// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';

class GenericZeroState extends StatelessWidget {
  const GenericZeroState({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
    this.ctaKey,
    required this.onCTATap,
    required this.ctaText,
  });

  final String iconPath;
  final String title;
  final String description;

  final Key? ctaKey;
  final String ctaText;
  final void Function()? onCTATap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              iconPath,
              width: MediaQuery.of(context).size.width / 2,
            ),
            smallVerticalSizedBox,
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
            smallVerticalSizedBox,
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            mediumVerticalSizedBox,
            PrimaryButton(
              buttonKey: ctaKey,
              onPressed: onCTATap,
              child: right(ctaText),
              customHeight: 48,
            ),
          ],
        ),
      ),
    );
  }
}
