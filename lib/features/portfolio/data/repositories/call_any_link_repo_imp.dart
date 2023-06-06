import 'package:dartz/dartz.dart';
import 'package:renjuki2/features/portfolio/data/datasources/call_any_link_data.dart';
import 'package:renjuki2/global/errors/exceptions.dart';
import 'package:renjuki2/global/errors/failures.dart';

import '../../domain/repositories/call_mob_link_repo.dart';

class CallAnyLinkRepoImp implements CallAnyLinkRepoBase {
  final CallMobAppData callAnyLinkData;
  CallAnyLinkRepoImp({required this.callAnyLinkData});

  @override
  Future<Either<Failure, bool>> callMobAppRepository() async {
    try {
      await callAnyLinkData.callMobileGoogleLink();
      return right(true);
    } on ServerException catch (err) {
      return left(ServerFuilure(err.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> callWebAppRepository() async {
    try {
      await callAnyLinkData.callWebLink();
      return right(true);
    } on ServerException catch (err) {
      return left(ServerFuilure(err.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> callIosAppRepository() async {
    try {
      await callAnyLinkData.callMobileIosLink();
      return right(true);
    } on ServerException catch (err) {
      return left(ServerFuilure(err.toString()));
    }
  }
}
