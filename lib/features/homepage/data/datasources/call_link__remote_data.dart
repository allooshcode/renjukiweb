abstract class CallLinkRemoteDataBase {
  Future<void> callLink();
}

abstract class CallAnyLinkDataBase {
  Future<void> callMobileGoogleLink();
  Future<void> callFaceBookLink();
  Future<void> callMobileIosLink();
}
