import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/container_injection.dart';
import 'package:renjuki2/features/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:renjuki2/features/homepage/presentation/pages/main_layout.dart';
import 'package:renjuki2/global/app_theme/app_theme_dark.dart';
import 'package:renjuki2/global/app_theme/app_theme_light.dart';

import 'features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/homepage/presentation/bloc/home_bloc/home_bloc.dart';
import 'global/router/app_router.dart';

class RenJukiApp extends StatelessWidget {
  const RenJukiApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => sl<HomeBloc>()),
        BlocProvider<AuthBloc>(create: (context) => sl<AuthBloc>())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,

        // home: MultiBlocProvider(providers: [
        //   BlocProvider(
        //     create: (context) => PortfolioBloc(
        //         callLinkedInUsecase: sl(),
        //         callResumeUsecase: sl(),
        //         callMobAppAndiodUsecase: sl(),
        //         callWebAppUsecase: sl(),
        //         callMobAppIosUsecase: sl()),
        //   )
        // ], child: const MyPortfolio()),
        theme: getAppThemeDataLight(),
        darkTheme: getAppThemeDataDark(),
        themeMode: ThemeMode.light,
        routerConfig: appRouter.router,
        // routerDelegate: AppRouterDelegate(authBloc: sl<AuthBloc>(), homeBloc: sl<HomeBloc>()),
        // routeInformationParser: AppRouteInformationParser(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Colors.blue,
      // appBar: AppBar(),

      body: MainLayout(),
    );
  }
}
