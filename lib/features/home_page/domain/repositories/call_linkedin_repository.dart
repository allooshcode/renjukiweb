import 'package:dartz/dartz.dart';
import 'package:renjuki/global/errors/failures.dart';


abstract class CallLinkedInRepository {
  Future<Either<Failure, bool>> callLinkedInREpository();
}
