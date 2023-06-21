// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthViewmodel on AuthViewmodelBase, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: 'AuthViewmodelBase.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: 'AuthViewmodelBase.isPasswordValid'))
          .value;
  Computed<Function>? _$loginPressedComputed;

  @override
  Function get loginPressed =>
      (_$loginPressedComputed ??= Computed<Function>(() => super.loginPressed,
              name: 'AuthViewmodelBase.loginPressed'))
          .value;

  late final _$emailAtom =
      Atom(name: 'AuthViewmodelBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'AuthViewmodelBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordVisibleAtom =
      Atom(name: 'AuthViewmodelBase.passwordVisible', context: context);

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'AuthViewmodelBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$loggedInAtom =
      Atom(name: 'AuthViewmodelBase.loggedIn', context: context);

  @override
  bool get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('AuthViewmodelBase.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$signupAsyncAction =
      AsyncAction('AuthViewmodelBase.signup', context: context);

  @override
  Future<void> signup() {
    return _$signupAsyncAction.run(() => super.signup());
  }

  late final _$forgotpassAsyncAction =
      AsyncAction('AuthViewmodelBase.forgotpass', context: context);

  @override
  Future<void> forgotpass() {
    return _$forgotpassAsyncAction.run(() => super.forgotpass());
  }

  late final _$AuthViewmodelBaseActionController =
      ActionController(name: 'AuthViewmodelBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$AuthViewmodelBaseActionController.startAction(
        name: 'AuthViewmodelBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$AuthViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$AuthViewmodelBaseActionController.startAction(
        name: 'AuthViewmodelBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$AuthViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$AuthViewmodelBaseActionController.startAction(
        name: 'AuthViewmodelBase.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$AuthViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUsername() {
    final _$actionInfo = _$AuthViewmodelBaseActionController.startAction(
        name: 'AuthViewmodelBase.validateUsername');
    try {
      return super.validateUsername();
    } finally {
      _$AuthViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword() {
    final _$actionInfo = _$AuthViewmodelBaseActionController.startAction(
        name: 'AuthViewmodelBase.validatePassword');
    try {
      return super.validatePassword();
    } finally {
      _$AuthViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logout() {
    final _$actionInfo = _$AuthViewmodelBaseActionController.startAction(
        name: 'AuthViewmodelBase.logout');
    try {
      return super.logout();
    } finally {
      _$AuthViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
passwordVisible: ${passwordVisible},
loading: ${loading},
loggedIn: ${loggedIn},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
loginPressed: ${loginPressed}
    ''';
  }
}

mixin _$LoginError on _LoginErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_LoginErrorBase.hasErrors'))
          .value;

  late final _$emailAtom =
      Atom(name: '_LoginErrorBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginErrorBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$loginAtom =
      Atom(name: '_LoginErrorBase.login', context: context);

  @override
  String? get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String? value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
login: ${login},
hasErrors: ${hasErrors}
    ''';
  }
}
