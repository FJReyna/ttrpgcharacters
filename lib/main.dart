import 'package:flutter/material.dart';
import 'package:ttrpgcharacter/core/app.dart';
import 'package:ttrpgcharacter/core/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const App());
}
