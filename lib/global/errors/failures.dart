import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
}

class ServerFuilure extends Failure {
  final String msgError;
  const ServerFuilure(this.msgError);
  @override
  List<Object?> get props => throw UnimplementedError();
}
