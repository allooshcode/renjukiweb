import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String msgError;
  const Failure(this.msgError);
}

class ServerFuilure extends Failure {

  const ServerFuilure(super.msgError);
  @override
  List<Object?> get props => throw UnimplementedError();
}
