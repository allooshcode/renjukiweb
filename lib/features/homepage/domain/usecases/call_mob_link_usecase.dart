import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:renjuki2/global/errors/failures.dart';

import '../repositories/call_mob_link_repo.dart';

class CallMobAppAndriodUsecase extends Equatable {
  final CallAnyLinkRepoBase callAnyLinkRepoBase;
  const CallMobAppAndriodUsecase(this.callAnyLinkRepoBase);

  Future<Either<Failure, bool>> callAnyLink() {
    return callAnyLinkRepoBase.callMobAppRepository();
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
