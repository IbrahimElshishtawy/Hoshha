import 'package:hoshha/app.dart';
import 'package:flutter/material.dart';
import 'package:hoshha/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const HoshhaApp());
}