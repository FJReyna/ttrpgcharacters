import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:ttrpgcharacter/core/app.dart';
import 'package:ttrpgcharacter/core/dependency_injection.dart';
import 'package:ttrpgcharacter/hive_registrar.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapters();
  await setup();
  runApp(const App());
}
