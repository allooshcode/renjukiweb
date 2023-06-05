import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki/container_injection.dart';
import 'package:renjuki/features/home_page//presentation/pages/main_layout.dart';
import 'package:renjuki/global/app_theme/app_theme_dark.dart';
import 'package:renjuki/global/app_theme/app_theme_light.dart';

import 'features/home_page//presentation/bloc/port_folio_bloc/portfolio_bloc.dart';

class RenjukiApp extends StatelessWidget {
  const RenjukiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => RenJukiBloc(
              callLinkedInUsecase: sl(),
              callResumeUsecase: sl(),
              callMobAppAndiodUsecase: sl(),
              callWebAppUsecase: sl(),
              callMobAppIosUsecase: sl()),
        )
      ], child: const MyPortfolio()),
      theme: getAppThemeDataLight(),
      darkTheme: getAppThemeDataDark(),
      themeMode: ThemeMode.light,
    );
  }
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Colors.blue,
      // appBar: AppBar(),
      body: MainLayout(),
    );
  }
}
