import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_detail_view_model.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:dartz/dartz.dart' as d;

class PricingCardWidget extends StatelessWidget {
  const PricingCardWidget({
    super.key,
    required this.pricing,
    this.onAddOrEdit,
  });

  final Function()? onAddOrEdit;
  final ProductPricing? pricing;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductDetailViewModel>(
      converter: ProductDetailViewModel.fromStore,
      builder: (BuildContext context, ProductDetailViewModel vm) {
        final double? parsedPrice = double.tryParse(pricing?.cost ?? '');
        final bool hasPrice = parsedPrice != null && parsedPrice > 0;

        final int maxTickets = pricing?.maxTickets ?? 0;

        final String tier = pricing?.ticketTier ?? UNKNOWN;
        final String iconPath = getTicketIconPath(tier);

        final String currencyCode =
            pricing?.currencyCode ?? kDefaultCurrencyCode;

        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: Row(
            spacing: 12,
            children: <Widget>[
              SvgPicture.asset(iconPath),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      getTicketDisplayName(tier),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    if (maxTickets > 0)
                      Text(
                        maxAllowedTickets(maxTickets),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  spacing: 8,
                  children: <Widget>[
                    if (hasPrice)
                      Text(
                        formatCurrency(parsedPrice, currencyCode: currencyCode),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    if (onAddOrEdit != null)
                      SecondaryButton(
                        customHeight: 36,
                        onPressed: onAddOrEdit,
                        child: d.right(hasPrice ? changeString : addPrice),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
