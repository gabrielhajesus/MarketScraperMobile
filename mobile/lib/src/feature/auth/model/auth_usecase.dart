import 'package:localization/localization.dart';
import 'package:predict/src/feature/auth/data/repository/auth_repository.dart';

import 'domain/user.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'email_required'.i18n();
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'login_password_required'.i18n();
    }
    if (password.length < 4) {
      return 'login_password_minimun'.i18n();
    }
    return null;
  }

  Future<User> login(User user) async {
    return _authRepository.login(user);
  }

  Future<User> register(User user) async {
    return _authRepository.register(user);
  }

  Future<User> resetPassword(String email) async {
    return _authRepository.resetPassword(email);
  }
}
