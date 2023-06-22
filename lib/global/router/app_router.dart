import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/pages/auth_page.dart';
import 'package:renjuki2/features/homepage/presentation/pages/main_layout.dart';

import '../../container_injection.dart';
import '../../features/homepage/presentation/bloc/home_bloc/home_bloc.dart';
import '../../features/homepage/presentation/pages/home_page.dart';

class AppRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final AuthBloc authenticationBloc;
  final HomeBloc homeBloc;
  // final GlobalKey<NavigatorState> navigatorKey;

  final bool _isInitialized = false;
  late RoutePath _currentPath;

  AppRouterDelegate({required this.authenticationBloc, required this.homeBloc})
      // : navigatorKey = GlobalKey<NavigatorState>(),
      : _currentPath = RoutePath.initial();

  @override
  RoutePath get currentPath {
    return _currentPath;
  }

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider<AuthBloc>( create: (context) => AuthBloc(signUpUseCase: sl()),
    // )
    //   ],
    //   child: BlocBuilder<AuthBloc,AuthState>(
    // builder: (context, state){
    //
    // if (state is GoSignUpState) {
    // _currentPath = RoutePath.signup();
    // }
    // if (state is SignInSuccessState) {
    // _currentPath = RoutePath.home();
    // } else if (state is SignUpSuccessState) {
    // _currentPath = RoutePath.signup();
    // }
    // else {
    // _currentPath = RoutePath.unknown();
    // }

    return Navigator(
      key: navigatorKey,
      pages: [
        if (_currentPath.isSignup)
          MaterialPage(
              child: SignUpPage(
                authBloc: authenticationBloc,
              ),
              fullscreenDialog: true),
        if (_currentPath.isHome)
          MaterialPage(
              child: MainLayout(
            homeBloc: homeBloc,
          )),
        if (_currentPath.isUnknown)
          MaterialPage(
              child: MainLayout(
            homeBloc: homeBloc,
          )),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        notifyListeners();
        _currentPath = RoutePath.home();

        // Handle navigation back from the home page
        // authenticationBloc.add(LogoutEvent());
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    if (configuration.isHome) {
      _currentPath = RoutePath.home();
    } else {
      _currentPath = RoutePath.signup();
    }
    notifyListeners();

    // final routeInformation = RouteInformation(
    //   location: _currentPath.toLocation(),
    // );
    // final routePath = configuration;
    // Router.of(navigatorKey.currentContext!).routerDelegate.setInitialRoutePath(routePath);

    // Handle the route changes here if necessary
    // For simplicity, we won't handle any route changes in this example
  }

  @override
  Future<bool> popRoute() {
    // TODO: implement popRoute
    throw UnimplementedError();
  }

  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();
  //
  // @override
  // Future<void> setInitialRoutePath(RoutePath configuration) {
  //   _currentPath = configuration;
  //   notifyListeners();
  //   return super.setInitialRoutePath(configuration);
  // }
}

class AppRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return RoutePath.home();
    } else if (uri.pathSegments.length == 1 &&
        uri.pathSegments.first == '/home') {
      return RoutePath.home();
    } else if (uri.pathSegments.first == '/signup') {
      return RoutePath.signup();
    } else {
      return RoutePath.unknown();
    }
  }

  @override
  RouteInformation restoreRouteInformation(RoutePath configuration) {
    if (configuration.isSignup) {
      return const RouteInformation(location: '/signup');
    } else if (configuration.isHome) {
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

  factory RoutePath.signup() =>
      RoutePath(isSignup: true, isHome: false, isUnknown: false);

  factory RoutePath.home() =>
      RoutePath(isSignup: false, isHome: true, isUnknown: false);

  factory RoutePath.unknown() =>
      RoutePath(isSignup: false, isHome: false, isUnknown: true);

  factory RoutePath.initial() =>
      RoutePath(isSignup: false, isHome: true, isUnknown: false);
}
