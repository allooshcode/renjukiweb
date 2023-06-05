import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:renjuki/features/home_page/domain/repositories/call_linkedin_repository.dart';
import 'package:renjuki/global/errors/failures.dart';


class CallLinkedInUsecase extends Equatable {
  final CallLinkedInRepository repositoryCallLinkedIn;
  const CallLinkedInUsecase(this.repositoryCallLinkedIn);

  Future<Either<Failure, bool>> callLinkedIn() {
    return repositoryCallLinkedIn.callLinkedInREpository();
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
