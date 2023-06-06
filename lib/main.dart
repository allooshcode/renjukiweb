import 'package:flutter/material.dart';

import 'package:renjuki2/container_injection.dart';
import 'package:renjuki2/main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSl();
  runApp(const MyPortfolioApp());
}
