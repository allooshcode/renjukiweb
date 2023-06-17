import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/pages/auth_page.dart';

import '../../features/homepage/presentation/pages/home_page.dart';

class AppRouterDelegate extends RouterDelegate<RoutePath> with ChangeNotifier {
  final AuthBloc authenticationBloc;
  final GlobalKey<NavigatorState> navigatorKey;

  final bool _isInitialized = false;
  late RoutePath _currentConfiguration;

  AppRouterDelegate({required this.authenticationBloc})
      : navigatorKey = GlobalKey<NavigatorState>(),
        _currentConfiguration = RoutePath.initial();

  @override
  RoutePath get currentConfiguration => _currentConfiguration;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: authenticationBloc,
      builder: (context, state) {
        if (state is SignInSuccessState) {
          _currentConfiguration = RoutePath.home();
        } else {
          _currentConfiguration = RoutePath.auth();
        }

        return Navigator(
          key: navigatorKey,
          pages: [
            if (_currentConfiguration.isAuth)
              const MaterialPage(child: AuthPage()),
            if (_currentConfiguration.isHome)
              const MaterialPage(child: HomePage()),
          ],
          onPopPage: (route, result) {
            if (!route.didPop(result)) {
              return false;
            }

            // Handle navigation back from the home page
            authenticationBloc.add(LogoutEvent());
            return true;
          },
        );
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    // Handle the route changes here if necessary
    // For simplicity, we won't handle any route changes in this example
  }

  @override
  Future<bool> popRoute() {
    // TODO: implement popRoute
    throw UnimplementedError();
  }
}

class AppRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return RoutePath.home();
    } else if (uri.pathSegments.length == 1 &&
        uri.pathSegments.first == 'home') {
      return RoutePath.home();
    } else if (uri.pathSegments.first == 'auth') {
      return RoutePath.auth();
    } else {
      return RoutePath.unknown();
    }
  }

  @override
  RouteInformation restoreRouteInformation(RoutePath configuration) {
    if (configuration.isAuth) {
      return const RouteInformation(location: '/auth');
    } else if (configuration.isHome) {
      return const RouteInformation(location: '/home');
    } else {
      return const RouteInformation(location: '/unknown');
    }
  }
}

class RoutePath {
  final bool isAuth;
  final bool isHome;
  final bool isUnknown;

  RoutePath({
    required this.isAuth,
    required this.isHome,
    required this.isUnknown,
  });

  factory RoutePath.auth() =>
      RoutePath(isAuth: true, isHome: false, isUnknown: false);

  factory RoutePath.home() =>
      RoutePath(isAuth: false, isHome: true, isUnknown: false);

  factory RoutePath.unknown() =>
      RoutePath(isAuth: false, isHome: false, isUnknown: true);

  factory RoutePath.initial() =>
      RoutePath(isAuth: false, isHome: true, isUnknown: false);
}
