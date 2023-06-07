import 'package:dartz/dartz.dart';
import 'package:renjuki2/global/errors/failures.dart';

abstract class CallResumeRepository {
  Future<Either<Failure, bool>> callResume();
}
