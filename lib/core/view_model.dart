import 'package:fullbooker/core/models.dart';
import 'package:fullbooker/core/repository.dart';

import 'observer.dart';

abstract class BaseViewModel<T extends Model> {
  CRUDRepository<T> get repository;
  set repository(CRUDRepository<T> repository);

  final List<EventObserver> _observerList = List.empty(growable: true);

  void subscribe(EventObserver o) {
    if (_observerList.contains(o)) return;

    _observerList.add(o);
  }

  bool unsubscribe(EventObserver o) {
    if (_observerList.contains(o)) {
      _observerList.remove(o);
      return true;
    } else {
      return false;
    }
  }

  void notify(ViewEvent event) {
    for (var element in _observerList) {
      element.notify(event);
    }
  }
}
