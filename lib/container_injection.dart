import 'package:get_it/get_it.dart';
import 'package:renjuki2/features/authentication/data/data_sources/signup_user_data.dart';
import 'package:renjuki2/features/authentication/data/repository/signup_repository_data_imp.dart';
import 'package:renjuki2/features/authentication/domain/repository/SignUpRepository.dart';
import 'package:renjuki2/features/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:renjuki2/features/homepage/data/datasources/call_any_link_data.dart';
import 'package:renjuki2/features/homepage/data/datasources/call_linkedin_data.dart';
import 'package:renjuki2/features/homepage/data/datasources/resume_data.dart';
import 'package:renjuki2/features/homepage/data/repositories/call_any_link_repo_imp.dart';
import 'package:renjuki2/features/homepage/data/repositories/call_linkedin_data.dart';
import 'package:renjuki2/features/homepage/data/repositories/resume_repository_data.dart';
import 'package:renjuki2/features/homepage/domain/repositories/call_linkedin_repository.dart';
import 'package:renjuki2/features/homepage/domain/repositories/call_mob_link_repo.dart';
import 'package:renjuki2/features/homepage/domain/repositories/resume_repository.dart';
import 'package:renjuki2/features/homepage/domain/usecases/call_linkedin_usecase.dart';
import 'package:renjuki2/features/homepage/domain/usecases/call_mob_link_usecase.dart';
import 'package:renjuki2/features/homepage/domain/usecases/call_mob_mob_ios_usecase.dart';
import 'package:renjuki2/features/homepage/domain/usecases/call_web_app_usecase.dart';
import 'package:renjuki2/features/homepage/domain/usecases/resume_usecase.dart';
import 'package:renjuki2/features/homepage/presentation/bloc/port_folio_bloc/home_bloc.dart';

import 'features/homepage/presentation/bloc/home_bloc/home_bloc.dart';

final sl = GetIt.I;

Future initSl() async {
  //contorllers
  sl.registerFactory(() => AuthBloc(signUpUseCase: sl()));

  sl.registerFactory(() => HomeBloc());
  //usecases

  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(signUpRepository: sl()));
  sl.registerLazySingleton<CallResumeUsecase>(() => CallResumeUsecase(sl()));
  sl.registerLazySingleton<CallLinkedInUsecase>(
      () => CallLinkedInUsecase(sl()));
  sl.registerLazySingleton<CallMobAppAndriodUsecase>(
      () => CallMobAppAndriodUsecase(sl()));
  sl.registerLazySingleton<CallWebAppUsecase>(() => CallWebAppUsecase(sl()));

  sl.registerLazySingleton<CallMobAppIosUsecase>(
      () => CallMobAppIosUsecase(sl()));

  //domain

  sl.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryDataImp(sl()));
  sl.registerLazySingleton<CallResumeRepository>(
      () => ResumeRepositoryData(resumeData: sl()));

  sl.registerLazySingleton<CallLinkedInRepository>(
      () => CallLinkedInDataRepository(sl()));

  sl.registerLazySingleton<CallAnyLinkRepoBase>(
      () => CallAnyLinkRepoImp(callAnyLinkData: sl()));

  //data
  sl.registerLazySingleton<SignUpUserData>(() => SignUpUserData());
  sl.registerLazySingleton<ResumeData>(() => ResumeData());
  sl.registerLazySingleton<CallLinkedInData>(() => CallLinkedInData());

  sl.registerLazySingleton<CallMobAppData>(() => CallMobAppData());
}
