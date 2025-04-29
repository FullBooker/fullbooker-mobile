import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/create_product_basic_details_action.dart';
import 'package:fullbooker/application/redux/actions/fetch_single_product_action.dart';
import 'package:fullbooker/application/redux/actions/update_product_action.dart';
import 'package:fullbooker/application/redux/actions/update_product_basic_details_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/validators.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

@RoutePage()
class ProductBasicDetailsPage extends StatelessWidget {
  ProductBasicDetailsPage({super.key, required this.workflowState});

  final WorkflowState workflowState;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(
        showBell: false,
        title: setupEvent,
      ),
      body: StoreConnector<AppState, ProductSetupViewModel>(
        converter: (Store<AppState> store) =>
            ProductSetupViewModel.fromState(store.state),
        onDispose: (Store<AppState> store) {
          nameController.dispose();
          descriptionController.dispose();
        },
        builder: (BuildContext context, ProductSetupViewModel vm) {
          nameController.text = vm.name;
          descriptionController.text = vm.description;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
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
                              productBasicDetails,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              productBasicDetailsCopy,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        CustomTextInput(
                          hintText: nameYourProduct,
                          controller: nameController,
                          labelText: '$nameString*',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) => validateProductName(
                            value,
                          ),
                          onChanged: (String value) {
                            context.dispatch(UpdateProductAction(name: value));
                          },
                          keyboardType: TextInputType.name,
                        ),
                        CustomTextInput(
                          hintText: productDescriptionCopy,
                          labelText: productDescription,
                          controller: descriptionController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (String value) {
                            context.dispatch(
                              UpdateProductAction(description: value),
                            );
                          },
                          maxLines: 3,
                          keyboardType: TextInputType.name,
                        ),
                      ],
                    ),
                  ),
                  StoreConnector<AppState, ProductSetupViewModel>(
                    converter: (Store<AppState> store) =>
                        ProductSetupViewModel.fromState(store.state),
                    onInit: (Store<AppState> store) {
                      context.dispatch(
                        FetchSingleProductAction(
                          client: AppWrapperBase.of(context)!.customClient,
                          workflowState: workflowState,
                        ),
                      );
                    },
                    builder: (BuildContext context, ProductSetupViewModel vm) {
                      if (context.isWaiting(CreateProductBasicDetailsAction)) {
                        return AppLoading();
                      }
                      return Column(
                        spacing: 12,
                        children: <Widget>[
                          PrimaryButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                if (workflowState == WorkflowState.CREATE) {
                                  context.dispatch(
                                    CreateProductBasicDetailsAction(
                                      client: AppWrapperBase.of(context)!
                                          .customClient,
                                      onSuccess: () => context.router.push(
                                        ProductLocationRoute(
                                          workflowState: workflowState,
                                        ),
                                      ),
                                      onError: (String error) =>
                                          showAlertDialog(
                                        context: context,
                                        assetPath: productZeroStateSVGPath,
                                        description: error,
                                      ),
                                    ),
                                  );
                                } else {
                                  context.dispatch(
                                    UpdateProductBasicDetailsAction(
                                      client: AppWrapperBase.of(context)!
                                          .customClient,
                                      onSuccess: () => context.router.push(
                                        ProductLocationRoute(
                                          workflowState: workflowState,
                                        ),
                                      ),
                                      onError: (String error) =>
                                          showAlertDialog(
                                        context: context,
                                        assetPath: productZeroStateSVGPath,
                                        description: error,
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                            child: d.right(continueString),
                          ),
                          SecondaryButton(
                            onPressed: () => context.router.maybePop(),
                            child: d.right(previousString),
                            fillColor: Colors.transparent,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
