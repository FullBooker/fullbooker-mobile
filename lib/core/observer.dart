import 'package:fullbooker/core/models.dart';

abstract class EventObserver {
  void notify(ViewEvent event);
}

abstract class ViewEvent<T extends Model> {
  String qualifier;

  ViewEvent(this.qualifier);

  @override
  String toString() {
    return 'ViewEvent{qualifier: $qualifier}';
  }
}

class LoadingEvent<T extends Model> extends ViewEvent<T> {
  bool isLoading;

  LoadingEvent({required this.isLoading}) : super("LoadingEvent");
}

class TasksLoadedEvent<T extends Model> extends ViewEvent<T> {
  final List<T> tasks;

  TasksLoadedEvent({required this.tasks}) : super("TasksLoadedEvent");
}

class TaskCreatedEvent<T extends Model> extends ViewEvent<T> {
  final T task;

  TaskCreatedEvent(this.task) : super("TaskCreatedEvent");
}
