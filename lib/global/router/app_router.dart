import 'package:equatable/equatable.dart';
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

  BuildContext? get context => navigatorKey.currentContext;

  @override
  AppRoutePath get currentConfiguration {
    if (context == null) {
      return AppRoutePath.initial();
    }
    if (BlocProvider.of<AuthBloc>(context!).isAuthPage) {
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
//     if(!homeBloc.isHomePage) {
//       return BlocProvider(
//   create: (context) => authBloc,
//   child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
//       return Navigator(
//         key: navigatorKey,
//         pages: authPages,
//         onPopPage: (route, result) {
//           if (!route.didPop(result)) {
//             return false;
//           }
//
//           if (BlocProvider.of<AuthBloc>(context).isAuthPage) {
//             BlocProvider.of<AuthBloc>(context).add(CloseAuthPageEvent());
//           }
//
//           return true;
//         },
//       );
//     }),
// );
//     }

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        print('$state im now in home builder....');
        if (state is HomePageOpenState) {
          return Navigator(
            key: navigatorKey,
            pages: homepages,
            onPopPage: (route, result) {
              if (!route.didPop(result)) {
                return false;
              }
              print('pop form home page');

              // if (authBloc.isAuthPage) {
              //   authBloc.add(CloseAuthPageEvent());

              return true;
            },
          );
        }
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            debugPrint('its auth builder ....');
            return Navigator(
              key: navigatorKey,
              pages: authPages,
              onPopPage: (route, result) {
                if (!route.didPop(result)) {
                  return false;
                }

                if (BlocProvider.of<AuthBloc>(context).isAuthPage) {
                  print('pop form auth page');
                  BlocProvider.of<AuthBloc>(context).add(CloseAuthPageEvent());
                }

                return true;
              },
            );
          },
        );
      },
    );

    // return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
    //   print('$state' 'in blockbuilder');
    //   if (state! is NavigateToAuthPageState) {
    //     print('im now in auth proviber....');
    //     return BlocBuilder<AuthBloc, AuthState>(
    //       builder: (context, state) {
    //         print('$state im now in auth builder....');
    //         if (state is AuthPageClosedState) {
    //           return Navigator(
    //             key: navigatorKey,
    //             pages: homepages,
    //             onPopPage: (route, result) {
    //               if (!route.didPop(result)) {
    //                 return false;
    //               }
    //
    //               if (authBloc.isAuthPage) {
    //                 authBloc.add(CloseAuthPageEvent());
    //               }
    //
    //               return true;
    //             },
    //           );
    //         }
    //         return Navigator(
    //           key: navigatorKey,
    //           pages: authPages,
    //           onPopPage: (route, result) {
    //             if (!route.didPop(result)) {
    //               return false;
    //             }
    //
    //             if (BlocProvider.of<AuthBloc>(context).isAuthPage) {
    //               print('pop form auth page');
    //               BlocProvider.of<AuthBloc>(context).add(CloseAuthPageEvent());
    //             }
    //
    //             return true;
    //           },
    //         );
    //       },
    //     );
    //   }
    //
    //   return Navigator(
    //     key: navigatorKey,
    //     pages: homepages,
    //     onPopPage: (route, result) {
    //       if (!route.didPop(result)) {
    //         return false;
    //       }
    //
    //       if (authBloc.isAuthPage) {
    //         authBloc.add(CloseAuthPageEvent());
    //       }
    //
    //       return true;
    //     },
    //   );
    // });
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath path) async {
    if (path.isSignup) {
      print('setNewRoutePath to singn up ........');

      BlocProvider.of<AuthBloc>(context!).add(AuthPageOpenedEvent());
      notifyListeners();
    } else {
      if (path.isHome) {
        debugPrint('its hommeee............... pht');
      }
      BlocProvider.of<HomeBloc>(context!).add(HomePageOpenedEvent());
      notifyListeners();
    }
  }
}

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return AppRoutePath.home();
    }

    final path = uri.pathSegments.first;

    switch (path) {
      case 'auth':
        // Handle profile page route
        // You can extract any additional path segments or query parameters as needed
        return AppRoutePath.signup();
      case 'home':
        // Handle authentication page route
        // You can extract any additional path segments or query parameters as needed
        return AppRoutePath.home();
      default:
        // Handle unknown route
        return AppRoutePath.home();
    }
  }

  @override
  RouteInformation restoreRouteInformation(AppRoutePath configuration) {
    if (configuration.isHome) {
      return const RouteInformation(location: '/home');
    } else if (configuration.isSignup) {
      return const RouteInformation(location: '/auth');
    } else {
      return const RouteInformation(location: '/unknown');
    }
  }
}

class AppRoutePath extends Equatable {
  final bool isSignup;
  final bool isHome;
  final bool isUnknown;

  const AppRoutePath({
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

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
