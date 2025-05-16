import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_currencies_action.dart';
import 'package:fullbooker/application/redux/actions/save_product_pricing_action.dart';
import 'package:fullbooker/application/redux/actions/update_selected_pricing_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/host/product_setup/widgets/product_pricing_input.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/ticket_types_dropdown.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/validators.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';

@RoutePage()
class AddProductPricingPage extends StatefulWidget {
  const AddProductPricingPage({super.key});

  @override
  State<AddProductPricingPage> createState() => _AddProductPricingPageState();
}

class _AddProductPricingPageState extends State<AddProductPricingPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _ticketFieldKey =
      GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: addTicketPrice),
      bottomNavigationBar: Container(
        padding: EdgeInsetsDirectional.all(16),
        color: Colors.white,
        child: StoreConnector<AppState, ProductSetupViewModel>(
          converter: (Store<AppState> store) =>
              ProductSetupViewModel.fromState(store.state),
          builder: (BuildContext context, ProductSetupViewModel vm) {
            final bool isLoading = context.isWaiting(SaveProductPricingAction);

            return PrimaryButton(
              isLoading: isLoading,
              onPressed: () {
                final bool formValid =
                    _formKey.currentState?.validate() ?? false;
                final bool isTicketValid =
                    _ticketFieldKey.currentState?.validate() ?? false;
                if (formValid && isTicketValid) {
                  context.dispatch(
                    SaveProductPricingAction(
                      client: AppWrapperBase.of(context)!.customClient,
                      onSuccess: () => context.router.maybePop(),
                      onError: (String error) => showAlertDialog(
                        context: context,
                        assetPath: productZeroStateSVGPath,
                        description: error,
                      ),
                    ),
                  );
                }
              },
              child: d.right(saveString),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StoreConnector<AppState, ProductSetupViewModel>(
                converter: (Store<AppState> store) =>
                    ProductSetupViewModel.fromState(store.state),
                onInit: (Store<AppState> store) {
                  context.dispatch(
                    FetchCurrenciesAction(
                      client: AppWrapperBase.of(context)!.customClient,
                    ),
                  );
                },
                builder: (BuildContext context, ProductSetupViewModel vm) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
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

                        TicketTypesDropdown(
                          fieldKey: _ticketFieldKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),

                        // Currency dropdown
                        PricingInput(),

                        CustomTextInput(
                          hintText: maxTicketsHint,
                          labelText: '$maximumTickets*',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: Validators.validateMaxTickets,
                          onChanged: (String value) {
                            final int? parsed = int.tryParse(value);
                            if (parsed != null) {
                              context.dispatch(
                                UpdateSelectedPricingAction(
                                  maxTickets: parsed,
                                ),
                              );
                            }
                          },
                          keyboardType: TextInputType.number,
                        ),
                        veryLargeVerticalSizedBox,
                        veryLargeVerticalSizedBox,
                        veryLargeVerticalSizedBox,
                        veryLargeVerticalSizedBox,
                        veryLargeVerticalSizedBox,
                        veryLargeVerticalSizedBox,
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
