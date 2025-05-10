import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/ticket_type.dart';

class SelectProductTicketTypeAction extends ReduxAction<AppState> {
  SelectProductTicketTypeAction({required this.selectedTicketType});

  final TicketType? selectedTicketType;

  @override
  AppState? reduce() {
    return state.copyWith.hostState?.call(
      selectedTicketType:
          selectedTicketType ?? state.hostState?.selectedTicketType,
    );
  }
}
