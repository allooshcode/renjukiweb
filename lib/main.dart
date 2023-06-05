import 'package:flutter/material.dart';
import 'package:renjuki/container_injection.dart';
import 'package:renjuki/main_app.dart';
import 'package:renjuki/container_injection.dart';
import 'package:renjuki/main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSl();
  runApp(const RenjukiApp());
}
