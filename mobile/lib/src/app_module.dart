import 'package:flutter_modular/flutter_modular.dart';
import 'feature/auth/auth_module.dart';
import 'feature/home/home_module.dart';
import 'feature/onboard/onboard_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        //ModuleRoute('/', module: OnboardModule()),
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/auth', module: AuthModule()),
      ];
}
