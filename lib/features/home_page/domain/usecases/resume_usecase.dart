import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_porfolio/features/portfolio/domain/repositories/resume_repository.dart';
import 'package:my_porfolio/global/errors/failures.dart';

class CallResumeUsecase extends Equatable {
  final CallResumeRepository repositoryCallResume;
  const CallResumeUsecase(this.repositoryCallResume);

  Future<Either<Failure, bool>> callResume() {
    return repositoryCallResume.callResume();
  }

  @override
  List<Object?> get props => [repositoryCallResume];
}
