import 'package:fullbooker/core/repository.dart';
import 'package:fullbooker/core/view_model.dart';
import 'package:fullbooker/features/auth/models/login.dart';

class LoginViewModel extends BaseViewModel<Token> {
  late CRUDRepository<Token> _repository;
  @override
  CRUDRepository<Token> get repository => _repository;
  @override
  set repository(CRUDRepository<Token> repository) => _repository = repository;

  LoginViewModel() {
    repository = CRUDRepository<Token>("accounts", TokenSerializer());
  }
}
