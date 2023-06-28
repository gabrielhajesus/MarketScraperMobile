import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import 'domain/user.dart';
import 'auth_interface.dart';

class AuthUseCase {
  final repository = Modular.get<IAuth>();

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

  Future<User> login(String username, String password) {
    return repository.login(User(username, password));
  }

  Future<User> signup(String username, String password) {
    return repository.signup(User(username, password));
  }

  Future<User> forgotpass(String username) {
    return repository.forgotpass(User(username, null));
  }
}
