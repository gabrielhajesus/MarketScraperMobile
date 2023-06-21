import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../model/auth_usecase.dart';

part 'auth_viewmodel.g.dart';

class AuthViewmodel = AuthViewmodelBase with _$AuthViewmodel;

abstract class AuthViewmodelBase with Store {
  final _usecase = Modular.get<AuthUseCase>();
  final error = LoginError();

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  void validateUsername() {
    error.email = _usecase.validateEmail(email);
  }

  @action
  void validatePassword() {
    error.password = _usecase.validatePassword(password);
  }

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  Function get loginPressed =>
      (isEmailValid && isPasswordValid && !loading) ? login : login;

  @action
  Future<void> login() async {
    loading = true;
    try {
      await _usecase.login(email, password);
    } on UnimplementedError {
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> signup() async {
    loading = true;
    try {
      await _usecase.signup(email, password);
    } on UnimplementedError {
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> forgotpass() async {
    loading = true;
    try {
      await _usecase.forgotpass(email);
    } on UnimplementedError {
    } finally {
      loading = false;
    }
  }

  @action
  void logout() {
    loggedIn = false;
  }
}

class LoginError = _LoginErrorBase with _$LoginError;

abstract class _LoginErrorBase with Store {
  @observable
  String? email;

  @observable
  String? password;

  @observable
  String? login;

  @computed
  bool get hasErrors => email != null || password != null || login != null;

  void clear() {
    email = null;
    password = null;
    login = null;
  }
}
