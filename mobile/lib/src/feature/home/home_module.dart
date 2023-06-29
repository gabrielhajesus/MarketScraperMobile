import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:predict/src/feature/itempage/view/page/itempage.dart';
import 'view/page/homepage.dart';
import '../../feature/home/view_model/home_viewmodel.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => HomeViewModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => HomePage()),
        ChildRoute('/itempage/',
            child: (_, args) => ItemDetailsPage(item: args.data))
      ];
}
