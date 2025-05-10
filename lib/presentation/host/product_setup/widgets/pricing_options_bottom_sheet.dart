import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_pricing_options_action.dart';
import 'package:fullbooker/application/redux/actions/set_product_pricing_options_action.dart';
import 'package:fullbooker/application/redux/actions/toggle_pricing_option_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/entities/pricing_option.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:heroicons/heroicons.dart';

class PricingOptionsBottomSheet extends StatelessWidget {
  const PricingOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 16,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: <Widget>[
                        Text(
                          selectTicketType,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          selectTicketTypeCopy,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).primaryColor.withValues(alpha: .1),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(4),
                    child: IconButton(
                      onPressed: () => context.router.maybePop(),
                      icon: HeroIcon(
                        HeroIcons.xMark,
                        color: Theme.of(context).primaryColor,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
              StoreConnector<AppState, ProductSetupViewModel>(
                converter: (Store<AppState> store) =>
                    ProductSetupViewModel.fromState(store.state),
                onInit: (Store<AppState> store) {
                  // context.dispatch(ClearPricingOptionsAction());
                  context.dispatch(
                    FetchPricingOptionsAction(
                      client: AppWrapperBase.of(context)!.customClient,
                    ),
                  );
                },
                builder: (BuildContext context, ProductSetupViewModel vm) {
                  if (context.isWaiting(FetchPricingOptionsAction)) {
                    return AppLoading();
                  }

                  final List<PricingOption?>? options = vm.pricingOptions;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: options?.length,
                    itemBuilder: (BuildContext context, int index) {
                      final PricingOption? option = options![index];

                      final bool isSelected =
                          vm.selectedPricingOptionIDs?.contains(option?.id) ??
                              false;

                      return InkWell(
                        splashColor: Theme.of(context)
                            .primaryColor
                            .withValues(alpha: .1),
                        borderRadius: BorderRadius.circular(8),
                        highlightColor: Theme.of(context)
                            .primaryColor
                            .withValues(alpha: .1),
                        onTap: () {
                          // context.dispatch(
                          //   TogglePricingOptionAction(optionID: option?.id),
                          // );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Theme.of(context)
                                    .primaryColor
                                    .withValues(alpha: .05)
                                : null,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).dividerColor,
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  spacing: 8,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      option?.name ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            color: isSelected
                                                ? Theme.of(context).primaryColor
                                                : AppColors.textBlackColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              if (isSelected)
                                HeroIcon(
                                  HeroIcons.checkCircle,
                                  color: Theme.of(context).primaryColor,
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              StoreConnector<AppState, ProductSetupViewModel>(
                converter: (Store<AppState> store) =>
                    ProductSetupViewModel.fromState(store.state),
                builder: (BuildContext context, ProductSetupViewModel vm) {
                  if (context.isWaiting(SetProductPricingOptionsAction)) {
                    return AppLoading();
                  }

                  return PrimaryButton(
                    onPressed: () {
                      // context.dispatch(
                      //   SetProductPricingOptionsAction(
                      //     client: AppWrapperBase.of(context)!.customClient,
                      //     onSuccess: () => context.router.maybePop(),
                      //     onError: (String error) {
                      //       showAlertDialog(
                      //         context: context,
                      //         assetPath: productZeroStateSVGPath,
                      //         description: error,
                      //       );
                      //     },
                      //   ),
                      // );
                    },
                    child: right(saveString),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
