import 'package:dartz/dartz.dart';

import 'package:renjuki2/features/portfolio/domain/repositories/call_linkedin_repository.dart';
import 'package:renjuki2/global/errors/exceptions.dart';
import 'package:renjuki2/global/errors/failures.dart';

import '../datasources/call_linkedin_data.dart';

class CallLinkedInDataRepository implements CallLinkedInRepository {
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
