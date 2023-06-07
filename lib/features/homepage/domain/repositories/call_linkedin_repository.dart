import 'package:dartz/dartz.dart';
import 'package:renjuki2/global/errors/failures.dart';

abstract class CallLinkedInRepository {
  Future<Either<Failure, bool>> callLinkedInREpository();
}
