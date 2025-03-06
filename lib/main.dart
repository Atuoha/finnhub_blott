import 'package:finnhub_news/presentation/app_widget.dart';
import 'package:flutter/material.dart';

import 'core/global_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GlobalConfig.initConfig();
  runApp(const AppWidget());
}
