part of 'portfolio_bloc.dart';

abstract class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object> get props => [];
}

class LaunchWhatsAppEvent extends PortfolioEvent {
  const LaunchWhatsAppEvent();
}

class CallLinkedInEvent extends PortfolioEvent {
  const CallLinkedInEvent();
}

class CallResumeEvent extends PortfolioEvent {
  const CallResumeEvent();
}

class CallWebLinkEvent extends PortfolioEvent {
  const CallWebLinkEvent();
}

class CallMobLinkEvent extends PortfolioEvent {
  const CallMobLinkEvent({required this.isIphoneApp});
  final bool isIphoneApp;
}
