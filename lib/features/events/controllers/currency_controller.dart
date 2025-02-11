import 'package:fullbooker/core/repository.dart';
import 'package:fullbooker/core/view_model.dart';
import 'package:fullbooker/features/events/models/currency.dart';

class CurrencyViewModel extends BaseViewModel<Currency> {
  late CRUDRepository<Currency> _repository;
  @override
  CRUDRepository<Currency> get repository => _repository;
  @override
  set repository(CRUDRepository<Currency> repository) =>
      _repository = repository;

  CurrencyViewModel() {
    repository = CRUDRepository<Currency>("currencies", CurrencySerializer());
  }
}
