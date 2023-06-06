import 'package:dartz/dartz.dart';
import 'package:renjuki/features/home_page/domain/repositories/call_linkedin_repository.dart';
import 'package:renjuki/global/errors/exceptions.dart';
import 'package:renjuki/global/errors/failures.dart';

import '../datasources/call_linkedin_data.dart';

class CallLinkedInDataRepository extends CallLinkedInRepository {
  final CallLinkedInData callLinkedInData;
  CallLinkedInDataRepository(this.callLinkedInData);

  @override
  Future<Either<Failure, bool>> callLinkedInREpository() async {
    try {
      callLinkedInData.callLink();
      return right(true);
    } on ServerException catch (err) {
      return left(ServerFuilure(err.msgError));
    }
  }
}
