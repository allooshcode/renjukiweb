import 'package:dartz/dartz.dart';
import 'package:my_porfolio/global/errors/failures.dart';

abstract class CallLinkedInRepository {
  Future<Either<Failure, bool>> callLinkedInREpository();
}
