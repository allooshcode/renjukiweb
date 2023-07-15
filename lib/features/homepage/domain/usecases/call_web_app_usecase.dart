import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:renjuki2/global/errors/failures.dart';

import '../repositories/call_link_repo.dart';

class CallFaceBookUsecase extends Equatable {
  final CallAnyLinkRepoBase callAnyLinkRepoBase;
  const CallFaceBookUsecase(this.callAnyLinkRepoBase);

  Future<Either<Failure, bool>> callFaceBook() {
    return callAnyLinkRepoBase.callFaceBook();
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
