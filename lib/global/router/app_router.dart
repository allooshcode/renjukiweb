import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/pages/auth_page.dart';
import 'package:renjuki2/features/homepage/presentation/pages/main_layout.dart';

import '../../container_injection.dart';
import '../../features/homepage/presentation/bloc/home_bloc/home_bloc.dart';
import '../../features/homepage/presentation/pages/home_page.dart';

// App Router Delegate
class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final HomeBloc homeBloc;
  final AuthBloc authBloc;

  AppRouterDelegate({required this.homeBloc, required this.authBloc}) {
    // homeBloc.stream.listen((event) {});
    // authBloc.stream.listen((event) {});
  }

  @override
  AppRoutePath get currentConfiguration {
    if (authBloc.isAuthPage) {
      return AppRoutePath.signup();
    } else {
      return AppRoutePath.home();
    }
  }

  List<Page> homepages = [
    MaterialPage(
      key: const ValueKey('HomePage'),
      child: MainLayout(
        homeBloc: sl(),
      ),
    )
  ];
  List<Page> authPages = [
    MaterialPage(
      key: const ValueKey('Signup'),
      child: SignUpPage(
        authBloc: sl(),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(create: (context) => sl()),
          BlocProvider<AuthBloc>(
              create: (context) => AuthBloc(signUpUseCase: sl()))
        ],
        child: BlocBuilder<HomeBloc, HomeState>(
            bloc: HomeBloc(),
            builder: (context, state) {
              if (state is NavigateToAuthPageState) {
                return Navigator(
                  key: navigatorKey,
                  pages: authPages,
                  onPopPage: (route, result) {
                    if (!route.didPop(result)) {
                      return false;
                    }

                    if (authBloc.isAuthPage) {
                      authBloc.add(CloseAuthPageEvent());
                    }

                    return true;
                  },
                );
              } else {
                return Navigator(
                  key: navigatorKey,
                  pages: homepages,
                  onPopPage: (route, result) {
                    if (!route.didPop(result)) {
                      return false;
                    }

                    if (authBloc.isAuthPage) {
                      authBloc.add(CloseAuthPageEvent());
                    }

                    return true;
                  },
                );
              }
            }));
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath path) async {
    if (path.isSignup) {
      homeBloc.add(NavigateToAuthPageEvent());
    } else {
      homeBloc.add(HomePageOpenedEvent());
    }
  }
}

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isNotEmpty && uri.pathSegments[1] == '/unknown') {
      return AppRoutePath.unknown();
    } else if (uri.pathSegments.isNotEmpty && uri.pathSegments[1] == '/auth') {
      return AppRoutePath.signup();
    } else {
      return AppRoutePath.home();
    }
  }

  @override
  RouteInformation restoreRouteInformation(AppRoutePath path) {
    if (path.isHome) {
      return const RouteInformation(location: '/home');
    } else if (path.isSignup) {
      return const RouteInformation(location: '/auth');
    } else {
      return const RouteInformation(location: '/unknown');
    }
  }
}

class AppRoutePath {
  final bool isSignup;
  final bool isHome;
  final bool isUnknown;

  AppRoutePath({
    required this.isSignup,
    required this.isHome,
    required this.isUnknown,
  });

  String toLocation() {
    if (isHome) {
      return '/home';
    } else if (isSignup) {
      return '/auth';
    } else if (isUnknown) {
      return '/unknown';
    }

    return '/';
  }

  factory AppRoutePath.signup() =>
      AppRoutePath(isSignup: true, isHome: false, isUnknown: false);

  factory AppRoutePath.home() =>
      AppRoutePath(isSignup: false, isHome: true, isUnknown: false);

  factory AppRoutePath.unknown() =>
      AppRoutePath(isSignup: false, isHome: false, isUnknown: true);

  factory AppRoutePath.initial() =>
      AppRoutePath(isSignup: false, isHome: true, isUnknown: false);
}
