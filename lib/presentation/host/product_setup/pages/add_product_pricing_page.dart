import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class AddProductPricingPage extends StatelessWidget {
  const AddProductPricingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBell: false,
        title: addTicketPrice,
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
                            setupTickerPrice,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            setupTickerPriceCopy,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),

                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: Row(
                          spacing: 12,
                          children: <Widget>[
                            SvgPicture.asset(regularTicketIconSVGPath),
                            Text(
                              vip,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),

                      // TODO(abiud): add currency dropdown

                      CustomTextInput(
                        hintText: priceHint,
                        labelText: priceString,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (String value) {},
                        keyboardType: TextInputType.number,
                        prefixIconData: HeroIcons.currencyDollar,
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
                              HeroIcons.informationCircle,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              serviceFeeDisclaimer(kPlatformServiceFee),
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

                      CustomTextInput(
                        hintText: maxTicketsHint,
                        labelText: maximumTickets(vip),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (String value) {},
                        keyboardType: TextInputType.number,
                      ),

                      CustomTextInput(
                        hintText: discountHint,
                        labelText: discountLabel,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (String value) {},
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            PrimaryButton(
              onPressed: () {
                context.router.push(ProductPricingRoute());
              },
              child: d.right(saveString),
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
