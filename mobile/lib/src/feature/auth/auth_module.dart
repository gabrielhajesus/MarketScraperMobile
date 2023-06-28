import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:predict/src/feature/auth/data/repository/auth_repository.dart';
import 'package:predict/src/feature/auth/view/page/forgotpasspage.dart';
import 'package:predict/src/feature/auth/view/page/loginpage.dart';
import 'package:predict/src/feature/auth/view/page/signuppage.dart';
import 'package:predict/src/feature/auth/view_model/auth_viewmodel.dart';

import 'model/auth_interface.dart';
import 'model/auth_usecase.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind<AuthInterface>((i) => AuthRepository()),
        Bind((i) => AuthUseCase(i.get<AuthRepository>())),
        Bind((i) => AuthViewModel(i.get<AuthUseCase>())),
        Bind((i) => Dio()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => LoginPage()),
        ChildRoute('/login', child: (_, __) => LoginPage()),
        ChildRoute('/signup', child: (_, __) => SignUpPage()),
        ChildRoute('/forgotpass', child: (_, __) => ForgotPassPage()),
      ];
}
