import 'package:fullbooker/core/repository.dart';
import 'package:fullbooker/core/view_model.dart';
import 'package:fullbooker/features/host/models/old_currency.dart';

class CurrencyViewModel extends BaseViewModel<OldCurrency> {
  late CRUDRepository<OldCurrency> _repository;
  @override
  CRUDRepository<OldCurrency> get repository => _repository;
  @override
  set repository(CRUDRepository<OldCurrency> repository) =>
      _repository = repository;

  CurrencyViewModel() {
    repository =
        CRUDRepository<OldCurrency>('currencies', CurrencySerializer());
  }
}
