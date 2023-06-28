import 'package:flutter_modular/flutter_modular.dart';
import '../../feature/home/view_model/home_viewmodel.dart';
import '../itempage/view/page/itempage.dart';

class ItemPageModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => ItemDetailsPage(
      ),
    ),
  ];
}