import 'package:fullbooker/features/host/models/categories.dart';
import 'package:fullbooker/core/repository.dart';
import 'package:fullbooker/core/view_model.dart';

class CategoryViewModel extends BaseViewModel<Category> {
  late CRUDRepository<Category> _repository;
  @override
  CRUDRepository<Category> get repository => _repository;
  @override
  set repository(CRUDRepository<Category> repository) =>
      _repository = repository;

  CategoryViewModel() {
    repository = CRUDRepository<Category>("categories", CategorySerializer());
  }
}
