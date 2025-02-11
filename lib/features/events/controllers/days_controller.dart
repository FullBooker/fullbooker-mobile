import 'package:fullbooker/core/repository.dart';
import 'package:fullbooker/core/view_model.dart';
import 'package:fullbooker/features/events/models/days.dart';

class DaysViewModel extends BaseViewModel<Days> {
  late CRUDRepository<Days> _repository;
  @override
  CRUDRepository<Days> get repository => _repository;
  @override
  set repository(CRUDRepository<Days> repository) => _repository = repository;

  DaysViewModel() {
    repository = CRUDRepository<Days>("days-of-week", DaysSerializer());
  }
}
