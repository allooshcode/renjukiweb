import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_porfolio/global/errors/failures.dart';

import '../repositories/call_linkedin_repository.dart';

class CallLinkedInUsecase extends Equatable {
  final CallLinkedInRepository repositoryCallLinkedIn;
  const CallLinkedInUsecase(this.repositoryCallLinkedIn);

  Future<Either<Failure, bool>> callLinkedIn() {
    return repositoryCallLinkedIn.callLinkedInREpository();
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
