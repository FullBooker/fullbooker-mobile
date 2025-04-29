import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/shared/entities/enums.dart';

class SetWorkflowStateAction extends ReduxAction<AppState> {
  SetWorkflowStateAction({this.workflowState});

  final WorkflowState? workflowState;

  @override
  AppState? reduce() {
    return state.copyWith.hostState?.call(
      workflowState: workflowState ?? state.hostState?.workflowState,
    );
  }
}
