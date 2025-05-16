import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/clear_selected_ticket_type_options_action.dart';
import 'package:fullbooker/application/redux/actions/fetch_ticket_types_action.dart';
import 'package:fullbooker/application/redux/actions/select_product_ticket_type_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/domain/core/entities/ticket_type.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/custom_dropdown.dart';

class TicketTypesDropdown extends StatelessWidget {
  const TicketTypesDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductSetupViewModel>(
      converter: (Store<AppState> store) =>
          ProductSetupViewModel.fromState(store.state),
      onInit: (Store<AppState> store) {
        context.dispatch(ClearSelectedTicketTypeOptionsAction());
        context.dispatch(
          FetchTicketTypesAction(
            client: AppWrapperBase.of(context)!.customClient,
          ),
        );
      },
      builder: (BuildContext context, ProductSetupViewModel vm) {
        if (context.isWaiting(FetchTicketTypesAction)) {
          return AppLoading();
        }

        final List<TicketType> validTypes = vm.ticketTypes
            .where(
              (TicketType? t) => t != null && (t.name?.isNotEmpty ?? false),
            )
            .cast<TicketType>()
            .toList();

        final List<String> options =
            validTypes.map((TicketType t) => t.name!).toList();

        final String? selectedName = vm.selectedTicketType?.name;

        final String value = options.contains(selectedName)
            ? selectedName!
            : (options.isNotEmpty ? options.first : '');

        return CustomDropdown(
          labelText: ticketTypeString,
          options: options,
          value: value,
          onChanged: (String? newName) {
            if (newName == null || newName.isEmpty) return;

            final TicketType picked = validTypes.firstWhere(
              (TicketType t) => t.name == newName,
              orElse: () => validTypes.first,
            );

            context.dispatch(
              SelectProductTicketTypeAction(selectedTicketType: picked),
            );
          },
        );
      },
    );
  }
}
