import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.level = Level.verbose;
  runApp(MyApp());
}
