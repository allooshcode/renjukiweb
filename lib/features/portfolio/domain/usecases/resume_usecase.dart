import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:renjuki2/features/portfolio/domain/repositories/resume_repository.dart';
import 'package:renjuki2/global/errors/failures.dart';

class CallResumeUsecase extends Equatable {
  final CallResumeRepository repositoryCallResume;
  const CallResumeUsecase(this.repositoryCallResume);

  Future<Either<Failure, bool>> callResume() {
    return repositoryCallResume.callResume();
  }

  @override
  List<Object?> get props => [repositoryCallResume];
}
