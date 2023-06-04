import 'package:dartz/dartz.dart';
import 'package:renjuki/global/errors/failures.dart';

abstract class CallResumeRepository {
  Future<Either<Failure, bool>> callResume();
}
