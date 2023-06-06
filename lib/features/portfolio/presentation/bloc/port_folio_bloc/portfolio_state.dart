part of 'portfolio_bloc.dart';

abstract class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object> get props => [];
}

class PortfolioInitial extends PortfolioState {}

class LaunchingWhatsState extends PortfolioState {}

class LaunchedWhatsState extends PortfolioState {}

class LinkedInStateInit extends PortfolioState {}

class LinkedInStateDone extends PortfolioState {}

class LinkedInStateError extends PortfolioState {}

class ResumeStateError extends PortfolioState {}

class ResumeStateDone extends PortfolioState {}

class CallWebAppLinkStateError extends PortfolioState {}

class CallWebAppLinkStateDone extends PortfolioState {}

class CallMobAppLinkStateError extends PortfolioState {}

class CallMobAppLinkStateDone extends PortfolioState {}