import 'package:dartz/dartz.dart';
import 'package:renjuki2/global/errors/failures.dart';

abstract class CallAnyLinkRepoBase {
  Future<Either<Failure, bool>> callMobAppRepository();
  Future<Either<Failure, bool>> callWebAppRepository();
  Future<Either<Failure, bool>> callIosAppRepository();
}
