part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GoToSignupEvent extends HomeEvent {

}


class NavigateToAuthPageEvent extends HomeEvent {}

class HomePageOpenedEvent extends HomeEvent {}

// class LaunchWhatsAppEvent extends HomeEvent {
//   const LaunchWhatsAppEvent();
// }
//
// class CallLinkedInEvent extends HomeEvent {
//   const CallLinkedInEvent();
// }
//
// class CallResumeEvent extends HomeEvent {
//   const CallResumeEvent();
// }
//
class FaceBookCallEvent extends HomeEvent {
  const FaceBookCallEvent();
}
//
// class CallMobLinkEvent extends HomeEvent {
//   const CallMobLinkEvent({required this.isIphoneApp});
//   final bool isIphoneApp;
// }
