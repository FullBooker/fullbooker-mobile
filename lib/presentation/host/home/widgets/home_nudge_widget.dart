import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';

class HomeNudgeWidget extends StatelessWidget {
  const HomeNudgeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(context).dividerColor.withAlpha(50),
            offset: const Offset(0, 8),
            blurRadius: 30,
          ),
        ],
        image: const DecorationImage(
          image: AssetImage(homeNudgeImagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: width * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: <Widget>[
              Text(
                homeNudgeCopy,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 18,
                    ),
              ),
              PrimaryButton(
                color: Colors.black,
                customWidth: width * 0.4,
                onPressed: () => context.router.push(ProductCategoryRoute()),
                child: right(startSetup),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
