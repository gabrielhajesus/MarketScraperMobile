import 'package:flutter_modular/flutter_modular.dart';
import 'data/repository/auth_repository.dart';
import 'model/auth_interface.dart';
import 'model/auth_usecase.dart';
import '../../feature/auth/view_model/auth_viewmodel.dart';
import 'view/page/forgotpasspage.dart';
import 'view/page/loginpage.dart';
import 'view/page/signuppage.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => AuthViewmodel()),
        Bind.factory((i) => AuthUseCase()),
        Bind.factory<IAuth>((i) => AuthRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const LoginPage()),
        ChildRoute('/login', child: (_, __) => const LoginPage()),
        ChildRoute('/signup', child: (_, __) => const SignUpPage()),
        ChildRoute('/forgotpass', child: (_, __) => const ForgotPassPage()),
      ];
}
