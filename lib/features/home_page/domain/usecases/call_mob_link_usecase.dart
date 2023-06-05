import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:renjuki/features/home_page/domain/repositories/call_mob_link_repo.dart';
import 'package:renjuki/global/errors/failures.dart';



class CallMobAppAndriodUsecase extends Equatable {
  final CallAnyLinkRepoBase callAnyLinkRepoBase;
  const CallMobAppAndriodUsecase(this.callAnyLinkRepoBase);

  Future<Either<Failure, bool>> callAnyLink() {
    return callAnyLinkRepoBase.callMobAppRepository();
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
