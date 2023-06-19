import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/pages/auth_page.dart';
import 'package:renjuki2/features/homepage/presentation/pages/main_layout.dart';

import '../../features/homepage/presentation/pages/home_page.dart';

class AppRouterDelegate extends RouterDelegate<RoutePath> with ChangeNotifier {
  final AuthBloc authenticationBloc;
  final GlobalKey<NavigatorState> navigatorKey;

  final bool _isInitialized = false;
  late RoutePath _currentPath;

  AppRouterDelegate({required this.authenticationBloc})
      : navigatorKey = GlobalKey<NavigatorState>(),
        _currentPath = RoutePath.initial();

  @override
  RoutePath get currentPath => _currentPath;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: authenticationBloc,
      builder: (context, state) {
        if(state is GoSignUpState){
          _currentPath = RoutePath.signup();

        }
        if (state is SignInSuccessState) {
          _currentPath = RoutePath.home();
        } else if(state is SignUpSuccessState){
          _currentPath = RoutePath.signup();
        }
        else{ _currentPath = RoutePath.unknown();}
        return Navigator(
          key: navigatorKey,
          pages: [
            if (_currentPath.isSignup)
              const MaterialPage(child: SignUpPage()),
            if (_currentPath.isHome)
              const MaterialPage(child: MainLayout()),
            if(_currentPath.isUnknown)
              const MaterialPage(child: MainLayout()),
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
    } else if (uri.pathSegments.first == 'signup') {
      return RoutePath.signup();
    } else {
      return RoutePath.unknown();
    }
  }

  @override
  RouteInformation restoreRouteInformation(RoutePath path) {
    if (path.isSignup) {
      return const RouteInformation(location: '/signup');
    } else if (path.isHome) {
      return const RouteInformation(location: '/home');
    } else {
      return const RouteInformation(location: '/unknown');
    }
  }
}

class RoutePath {
  final bool isSignup;
  final bool isHome;
  final bool isUnknown;

  RoutePath({
    required this.isSignup,
    required this.isHome,
    required this.isUnknown,
  });

  factory RoutePath.signup() =>
      RoutePath(isSignup: true, isHome: false, isUnknown: false);

  factory RoutePath.home() =>
      RoutePath(isSignup: false, isHome: true, isUnknown: false);

  factory RoutePath.unknown() =>
      RoutePath(isSignup: false, isHome: false, isUnknown: true);

  factory RoutePath.initial() =>
      RoutePath(isSignup: false, isHome: true, isUnknown: false);
}
