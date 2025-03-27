import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/host/product_setup/components/product_type_item.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

@RoutePage()
class SetupProductTypePage extends StatelessWidget {
  const SetupProductTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBell: false,
        title: setupProductType,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: <Widget>[
                      Text(
                        categoryStep1,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        productType,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        productTypeCopy,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  ProductTypeItem(
                    title: eventsName,
                    description: eventDescription,
                    isSelected: true,
                  ),
                  ProductTypeItem(
                    title: activities,
                    description: activitiesCopy,
                  ),
                ],
              ),
            ),
            PrimaryButton(
              onPressed: () {
                context.router.push(SetupProductCategoryRoute());
              },
              child: d.right(continueString),
            ),
            SecondaryButton(
              onPressed: () {
                context.router.maybePop();
              },
              child: d.right(cancelString),
              fillColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
