import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_detail_view_model.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:fullbooker/domain/core/entities/currency.dart';
import 'package:dartz/dartz.dart' as d;

class PricingCardWidget extends StatelessWidget {
  const PricingCardWidget({
    super.key,
    required this.pricing,
    this.onAddOrEdit,
  });

  final ProductPricing? pricing;
  final Function()? onAddOrEdit;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductDetailViewModel>(
      converter: (Store<AppState> store) =>
          ProductDetailViewModel.fromState(store.state),
      builder: (BuildContext context, ProductDetailViewModel vm) {
        final double? parsedPrice = double.tryParse(pricing?.cost ?? '');
        final bool hasPrice = parsedPrice != null && parsedPrice > 0;

        // TODO(abiud): change this when the discount is available from the API
        const double? discount = null;

        final int maxTickets = pricing?.maxTickets ?? 0;

        final String tier = pricing?.ticketTier ?? '';
        final String iconPath = getTicketIconPath(tier);

        final String currencyCode = pricing?.currencyCode ?? 'KES';

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
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: <Widget>[
                    Text(
                      getTicketDisplayName(tier),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    if (discount != null && discount > 0)
                      Text(
                        discountValue(discount),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    if (maxTickets > 0)
                      Text(
                        maxAllowedTickets(maxTickets),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
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
