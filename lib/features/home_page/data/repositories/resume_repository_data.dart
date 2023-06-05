import 'package:dartz/dartz.dart';
import 'package:renjuki/features/home_page//domain/repositories/resume_repository.dart';
import 'package:renjuki/features/home_page/data/datasources/resume_data.dart';
import 'package:renjuki/global/errors/exceptions.dart';
import 'package:renjuki/global/errors/failures.dart';


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
