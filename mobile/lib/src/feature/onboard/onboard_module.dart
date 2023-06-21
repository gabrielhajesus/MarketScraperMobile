import 'package:flutter_modular/flutter_modular.dart';
import 'view/page/onboardpage.dart';
import '../../feature/onboard/view_model/onboard_viewmodel.dart';

class OnboardModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => OnboardViewModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const OnboardPage()),
      ];
}
