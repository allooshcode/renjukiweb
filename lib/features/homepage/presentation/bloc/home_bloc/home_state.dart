part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomePageInitState extends HomeState {}

class HomePageCurveOn extends HomeState {}

class HomepageCurveOff extends HomeState {}

// Home State

class HomePageOpenState extends HomeState {}

class HomePageClosedState extends HomeState {}

class NavigateToAuthPageState extends HomeState {}

//
// class LaunchingWhatsState extends HomeState {}
//
// class LaunchedWhatsState extends HomeState {}
//
// class LinkedInStateInit extends HomeState {}
//
// class LinkedInStateDone extends HomeState {}
//
// class LinkedInStateError extends HomeState {}
//
// class ResumeStateError extends HomeState {}
//
// class ResumeStateDone extends HomeState {}
//
class FaceBookCallStateSuccess extends HomeState {}

class FaceBookStateError extends HomeState {}
//
// class CallMobAppLinkStateError extends HomeState {}
//
// class CallMobAppLinkStateDone extends HomeState {}
