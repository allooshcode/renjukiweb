import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:renjuki2/container_injection.dart';
import 'package:renjuki2/global/bloc_observer.dart';
import 'package:renjuki2/global/router/app_router.dart';
import 'package:renjuki2/main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSl();
  final appRouter = AppRouter();

  await Firebase.initializeApp(
    // name: 'my-firebase',
    options: const FirebaseOptions(
        apiKey: "AIzaSyCt8y3WKuW7ixEVI7LZQoc3KG29Q12Xabc",
        authDomain: "renjuki.firebaseapp.com",
        projectId: "renjuki",
        storageBucket: "renjuki.appspot.com",
        messagingSenderId: "809331067449",
        appId: "1:809331067449:web:4925aea344ed1cbe579be8",
        measurementId: "G-2KZSHY58GT"),
  );

  Bloc.observer = MyBlocObserver();
  runApp(RenJukiApp(
    appRouter: appRouter,
  ));
}
