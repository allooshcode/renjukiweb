import 'package:get_it/get_it.dart';
import 'package:renjuki2/features/portfolio/data/datasources/call_any_link_data.dart';
import 'package:renjuki2/features/portfolio/data/datasources/call_linkedin_data.dart';
import 'package:renjuki2/features/portfolio/data/datasources/resume_data.dart';
import 'package:renjuki2/features/portfolio/data/repositories/call_any_link_repo_imp.dart';
import 'package:renjuki2/features/portfolio/data/repositories/call_linkedin_data.dart';
import 'package:renjuki2/features/portfolio/data/repositories/resume_repository_data.dart';
import 'package:renjuki2/features/portfolio/domain/repositories/call_linkedin_repository.dart';
import 'package:renjuki2/features/portfolio/domain/repositories/call_mob_link_repo.dart';
import 'package:renjuki2/features/portfolio/domain/repositories/resume_repository.dart';
import 'package:renjuki2/features/portfolio/domain/usecases/call_linkedin_usecase.dart';
import 'package:renjuki2/features/portfolio/domain/usecases/call_mob_link_usecase.dart';
import 'package:renjuki2/features/portfolio/domain/usecases/call_mob_mob_ios_usecase.dart';
import 'package:renjuki2/features/portfolio/domain/usecases/call_web_app_usecase.dart';
import 'package:renjuki2/features/portfolio/domain/usecases/resume_usecase.dart';
import 'package:renjuki2/features/portfolio/presentation/bloc/port_folio_bloc/portfolio_bloc.dart';

final sl = GetIt.I;

Future initSl() async {
  //contorllers

  sl.registerFactory(() => PortfolioBloc(
        callLinkedInUsecase: sl(),
        callResumeUsecase: sl(),
        callMobAppAndiodUsecase: sl(),
        callWebAppUsecase: sl(),
        callMobAppIosUsecase: sl(),
      ));
  //usecases
  sl.registerLazySingleton<CallResumeUsecase>(() => CallResumeUsecase(sl()));
  sl.registerLazySingleton<CallLinkedInUsecase>(
      () => CallLinkedInUsecase(sl()));
  sl.registerLazySingleton<CallMobAppAndriodUsecase>(
      () => CallMobAppAndriodUsecase(sl()));
  sl.registerLazySingleton<CallWebAppUsecase>(() => CallWebAppUsecase(sl()));

  sl.registerLazySingleton<CallMobAppIosUsecase>(
      () => CallMobAppIosUsecase(sl()));

  //domain
  sl.registerLazySingleton<CallResumeRepository>(
      () => ResumeRepositoryData(resumeData: sl()));

  sl.registerLazySingleton<CallLinkedInRepository>(
      () => CallLinkedInDataRepository(sl()));

  sl.registerLazySingleton<CallAnyLinkRepoBase>(
      () => CallAnyLinkRepoImp(callAnyLinkData: sl()));

  //data
  sl.registerLazySingleton<ResumeData>(() => ResumeData());
  sl.registerLazySingleton<CallLinkedInData>(() => CallLinkedInData());

  sl.registerLazySingleton<CallMobAppData>(() => CallMobAppData());
}
