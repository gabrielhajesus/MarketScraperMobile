import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:predict/mongodb.dart';
import 'package:predict/src/app_module.dart';
import 'package:predict/src/app_widget.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDataBase.connect();

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
