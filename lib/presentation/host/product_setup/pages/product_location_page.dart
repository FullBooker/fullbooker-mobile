import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/check_location_permission_action.dart';
import 'package:fullbooker/application/redux/actions/fetch_single_product_action.dart';
import 'package:fullbooker/application/redux/actions/set_product_location_action.dart';
import 'package:fullbooker/application/redux/actions/update_product_location_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/location_preview_widget.dart';
import 'package:fullbooker/presentation/shared/custom_bottom_nav_container.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class ProductLocationPage extends StatelessWidget {
  const ProductLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: setupEvent),
        bottomNavigationBar: CustomBottomNavContainer(
          child: StoreConnector<AppState, ProductSetupViewModel>(
            converter: (Store<AppState> store) =>
                ProductSetupViewModel.fromState(store.state),
            onInit: (Store<AppState> store) => context.dispatch(
              CheckLocationPermissionAction(),
            ),
            builder: (BuildContext context, ProductSetupViewModel vm) {
              final bool isLoading = context.isWaiting(<Type>[
                SetProductLocationAction,
                UpdateProductLocationAction,
              ]);

              final bool isEditing = vm.workflowState == WorkflowState.VIEW;

              return Row(
                spacing: 16,
                children: <Widget>[
                  Flexible(
                    child: SecondaryButton(
                      addBorder: true,
                      disabled: isLoading,
                      onPressed: () {
                        isEditing
                            ? context.router.popUntil(
                                (Route<dynamic> route) =>
                                    route.settings.name ==
                                    ProductReviewAndSubmitRoute.name,
                              )
                            : context.router.maybePop();
                      },
                      child: d.right(
                        isEditing ? backToPreview : previousString,
                      ),
                      fillColor: Colors.transparent,
                    ),
                  ),
                  Flexible(
                    child: PrimaryButton(
                      isLoading: isLoading,
                      onPressed: () {
                        if (isEditing) {
                          context.dispatch(
                            UpdateProductLocationAction(
                              onSuccess: () => context.router.popUntil(
                                (Route<dynamic> route) =>
                                    route.settings.name ==
                                    ProductReviewAndSubmitRoute.name,
                              ),
                              onError: (String error) => showAlertDialog(
                                context: context,
                                assetPath: productZeroStateSVGPath,
                                description: error,
                              ),
                              client: AppWrapperBase.of(context)!.customClient,
                            ),
                          );
                        } else {
                          context.dispatch(
                            SetProductLocationAction(
                              onSuccess: () =>
                                  context.router.push(ProductScheduleRoute()),
                              onError: (String error) => showAlertDialog(
                                context: context,
                                assetPath: productZeroStateSVGPath,
                                description: error,
                              ),
                              client: AppWrapperBase.of(context)!.customClient,
                            ),
                          );
                        }
                      },
                      child: d.right(continueString),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: StoreConnector<AppState, ProductSetupViewModel>(
            converter: (Store<AppState> store) =>
                ProductSetupViewModel.fromState(store.state),
            onInit: (Store<AppState> store) => context.dispatchAll(
              <ReduxAction<AppState>>[
                CheckLocationPermissionAction(),
                FetchSingleProductAction(
                  client: AppWrapperBase.of(context)!.customClient,
                ),
              ],
            ),
            builder: (BuildContext context, ProductSetupViewModel vm) {
              if (context.isWaiting(FetchSingleProductAction)) {
                return AppLoading();
              }

              final bool isLocationAdded =
                  hasValidLocation(vm.selectedLocation);

              final bool locationDenied = vm.locationPerms?.denied ?? true;
              final bool locationDeniedPermanently =
                  vm.locationPerms?.deniedForever ?? true;

              return ListView(
                shrinkWrap: true,
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
                            location,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            locationCopy,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      if (locationDenied || locationDeniedPermanently)
                        GenericZeroState(
                          iconPath: locationSVGPath,
                          title: locationPermsTitle,
                          description: locationPermsCopy,
                          onCTATap: () {
                            if (locationDeniedPermanently) {
                              openAppSettings();
                            } else {
                              context.dispatch(
                                CheckLocationPermissionAction(),
                              );
                            }
                          },
                          ctaText: locationDeniedPermanently
                              ? openSettings
                              : enableLocation,
                        )
                      else if (isLocationAdded)
                        LocationPreviewWidget(
                          location: vm.selectedLocation,
                        )
                      else
                        GenericZeroState(
                          iconPath: locationSVGPath,
                          title: setEventLocation,
                          description: locationZeroStateCopy,
                          onCTATap: () =>
                              context.router.push(ChooseLocationRoute()),
                          ctaText: pickLocation,
                        ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
