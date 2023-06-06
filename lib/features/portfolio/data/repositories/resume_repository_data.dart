import 'package:dartz/dartz.dart';
import 'package:renjuki2/features/portfolio/domain/repositories/resume_repository.dart';
import 'package:renjuki2/global/errors/exceptions.dart';
import 'package:renjuki2/global/errors/failures.dart';

import '../datasources/resume_data.dart';

class ResumeRepositoryData implements CallResumeRepository {
  final ResumeData resumeData;
  ResumeRepositoryData({required this.resumeData});

  @override
  Future<Either<Failure, bool>> callResume() async {
    try {
      await resumeData.callLink();
      return right(true);
    } on ServerException catch (err) {
      return left(ServerFuilure(err.toString()));
    }
  }
}
