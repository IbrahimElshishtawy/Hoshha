import 'package:flutter/widgets.dart';

import 'app/bootstrap/bootstrap.dart';
import 'app/hoshha_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(const HoshhaApp());
}
