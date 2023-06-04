abstract class CallLinkRemoteDataBase {
  Future<void> callLink();
}

abstract class CallAnyLinkDataBase {
  Future<void> callMobileGoogleLink();
  Future<void> callWebLink();
  Future<void> callMobileIosLink();
}
