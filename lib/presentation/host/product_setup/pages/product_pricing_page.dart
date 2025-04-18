import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/host/product_setup/widgets/pricing_card_widget.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductPricingPage extends StatelessWidget {
  const ProductPricingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBell: false,
        title: setupEvent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: <Widget>[
                          Text(
                            pricing,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            pricingCopy,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context)
                              .primaryColor
                              .withValues(alpha: .1),
                        ),
                        child: Row(
                          spacing: 8,
                          children: <Widget>[
                            HeroIcon(
                              HeroIcons.exclamationTriangle,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              addPricingErrorMsg,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      PricingCardWidget(
                        ticketType: earlyBird,
                        price: 1500,
                        discount: 20,
                        maxTickets: 300,
                        svgIconPath: earlyBirdTicketIconSVGPath,
                        onAddOrEdit: () {},
                      ),
                      PricingCardWidget(
                        ticketType: standard,
                        price: 2000,
                        maxTickets: 300,
                        svgIconPath: standardTicketIconSVGPath,
                        onAddOrEdit: () {},
                      ),
                      PricingCardWidget(
                        ticketType: vip,
                        maxTickets: 300,
                        svgIconPath: vvipTicketIconSVGPath,
                        onAddOrEdit: () {},
                      ),
                      PricingCardWidget(
                        ticketType: vvip,
                        maxTickets: 300,
                        svgIconPath: vipTicketIconSVGPath,
                        onAddOrEdit: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            PrimaryButton(
              onPressed: () {
                context.router.push(ProductReviewAndSubmitRoute());
              },
              child: d.right(continueString),
            ),
            SecondaryButton(
              onPressed: () => context.router.maybePop(),
              child: d.right(previousString),
              fillColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
