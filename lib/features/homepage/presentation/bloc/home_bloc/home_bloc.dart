import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:renjuki2/features/homepage/presentation/pages/home_page.dart';
import 'package:renjuki2/global/router/app_router.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  bool _isHomePageOpen = true;
  // final AppRouterDelegate routerDelegate;

  bool get isHomePage => _isHomePageOpen;

  HomeBloc() : super(HomePageInitState()) {

    on<HomePageOpenedEvent>((event, emit) {
      _isHomePageOpen = true;
      emit(HomePageOpenState());
    });

    on<NavigateToAuthPageEvent>((event, emit) {
      debugPrint('NavigateToAuthPageEvent');
      _isHomePageOpen = false;
      emit(HomePageClosedState());
      emit(NavigateToAuthPageState());
    });
  }
}

// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   bool _isHomePageOpen = true;
//
//   bool get isHomePage => _isHomePageOpen;
//
//   void openHomePage() {
//     _isHomePageOpen = true;
//     emit(HomePageOpenState());
//   }
//
//
//
//   void closeHomePage() {
//     _isHomePageOpen = false;
//     emit(HomePageClosedState());
//   }
//
//   HomeBloc() : super(HomePageInitState()) {
//
//     on<GoToSignupEvent>((event, state) {
//       emit(HomePageClosedState());
//     });
//
//     // on<CallMobLinkEvent>(eventOfMobApp);
//     //
//     // on<CallWebLinkEvent>(eventOfWeb);
//     //
//     // on<CallResumeEvent>(eventOfResume);
//     //
//     // on<LaunchWhatsAppEvent>(eventOfWhatsApp);
//     //
//     // on<CallLinkedInEvent>(eventOfLinkedIn);
//   }
//
//   Future eventOfSignUp(event, state) async {
//     emit(HomePageClosedState());
//   }
//   //
//   // Future launchWhatsApp({
//   //   required int phone,
//   //   required String message,
//   // }) async {
//   //   Uri url() {
//   //     if (!kIsWeb) {
//   //       // add the [https]
//   //       return Uri.parse(
//   //           "https://wa.me/$phone/?text=${Uri.parse(message)}"); // new line
//   //     } else {
//   //       // add the [https]
//   //       return Uri.parse(
//   //           "https://api.whatsapp.com/send?text=${Uri.parse(message)}"); // new line
//   //     }
//   //   }
//   //
//   //   if (await canLaunchUrl(url())) {
//   //     await launchUrl(url());
//   //   } else {
//   //     throw 'Could not launch ${url()}';
//   //   }
//   // }
//   //
//   // Future<void> contactwhatsapp() async {
//   //   try {
//   //     await Future.delayed(const Duration(seconds: 2));
//   //     await launchWhatsApp(
//   //       phone: 60104370100,
//   //       message: 'nice to get touch with you, please how can help you ?',
//   //     );
//   //   } catch (err) {
//   //     Fluttertoast.showToast(msg: err.toString());
//   //   }
//   // }
//   //
//   // Future eventOfLinkedIn(event, emit) async {
//   //   emit(LinkedInStateInit());
//   //   final response = await callLinkedInUsecase.callLinkedIn();
//   //   response.fold(
//   //       (l) => emit(LinkedInStateError()), (r) => emit(LinkedInStateDone()));
//   // }
//   //
//   // Future eventOfWhatsApp(event, emit) async {
//   //   emit(LaunchingWhatsState());
//   //   await contactwhatsapp();
//   //   emit(LaunchedWhatsState());
//   // }
//   //
//   // Future eventOfResume(event, emit) async {
//   //   final response = await callResumeUsecase.callResume();
//   //   response.fold(
//   //       (l) => emit(ResumeStateError()), (r) => emit(ResumeStateDone()));
//   // }
//   //
//   // Future eventOfWeb(event, emit) async {
//   //   final response = await callWebAppUsecase.callAnyLink();
//   //   response.fold((l) => emit(CallWebAppLinkStateError()),
//   //       (r) => emit(CallWebAppLinkStateDone()));
//   // }
//   //
//   // Future eventOfMobApp(CallMobLinkEvent event, emit) async {
//   //   if (kDebugMode) {
//   //     print('...........');
//   //   }
//   //   if (event.isIphoneApp) {
//   //     final response = await callMobAppIosUsecase.callAnyLink();
//   //     response.fold((l) => emit(CallMobAppLinkStateError()),
//   //         (r) => emit(CallMobAppLinkStateDone()));
//   //   } else {
//   //     final response = await callMobAppAndiodUsecase!.callAnyLink();
//   //     response.fold((l) => emit(CallMobAppLinkStateError()),
//   //         (r) => emit(CallMobAppLinkStateDone()));
//   //   }
//   // }
// }
