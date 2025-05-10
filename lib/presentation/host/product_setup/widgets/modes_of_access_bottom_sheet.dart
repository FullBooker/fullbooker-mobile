import 'package:async_redux/async_redux.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_pricing_options_action.dart';
import 'package:fullbooker/application/redux/actions/pick_pricing_option_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/entities/pricing_option.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:heroicons/heroicons.dart';

class ModesOfAccessBottomSheet extends StatelessWidget {
  const ModesOfAccessBottomSheet({
    super.key,
  });

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: <Widget>[
                  Text(
                    modeOfAccess,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    modeOfAccessBottomSheetCopy,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              StoreConnector<AppState, ProductSetupViewModel>(
                converter: (Store<AppState> store) =>
                    ProductSetupViewModel.fromState(store.state),
                onInit: (Store<AppState> store) {
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
                          vm.pickedPricingOption?.id == option?.id;

                      return InkWell(
                        splashColor: Theme.of(context)
                            .primaryColor
                            .withValues(alpha: .1),
                        borderRadius: BorderRadius.circular(8),
                        highlightColor: Theme.of(context)
                            .primaryColor
                            .withValues(alpha: .1),
                        onTap: () {
                          context.dispatch(
                            PickPricingOptionAction(option: option),
                          );
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
                                    if (option?.description?.isNotEmpty ??
                                        false)
                                      Text(
                                        option?.description ?? UNKNOWN,
                                        softWrap: true,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
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
              PrimaryButton(
                onPressed: () {},
                child: right(addModeOfAccess),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
