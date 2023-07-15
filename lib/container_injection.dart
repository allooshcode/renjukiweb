import 'package:get_it/get_it.dart';
import 'package:renjuki2/features/authentication/data/data_sources/auth_user_data.dart';
import 'package:renjuki2/features/authentication/data/repository/auth_repository_data_imp.dart';
import 'package:renjuki2/features/authentication/domain/repository/auth_Repository.dart';
import 'package:renjuki2/features/authentication/domain/usecases/auth_usecase.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:renjuki2/features/homepage/data/datasources/call_any_link_data.dart';
import 'package:renjuki2/features/homepage/data/datasources/call_link__remote_data.dart';
import 'package:renjuki2/features/homepage/data/datasources/call_linkedin_data.dart';
import 'package:renjuki2/features/homepage/data/datasources/resume_data.dart';
import 'package:renjuki2/features/homepage/data/repositories/call_any_link_repo_imp.dart';
import 'package:renjuki2/features/homepage/data/repositories/call_linkedin_data.dart';
import 'package:renjuki2/features/homepage/data/repositories/resume_repository_data.dart';
import 'package:renjuki2/features/homepage/domain/repositories/call_linkedin_repository.dart';
import 'package:renjuki2/features/homepage/domain/repositories/call_link_repo.dart';
import 'package:renjuki2/features/homepage/domain/repositories/resume_repository.dart';
import 'package:renjuki2/features/homepage/domain/usecases/call_linkedin_usecase.dart';
import 'package:renjuki2/features/homepage/domain/usecases/call_mob_link_usecase.dart';
import 'package:renjuki2/features/homepage/domain/usecases/call_mob_mob_ios_usecase.dart';
import 'package:renjuki2/features/homepage/domain/usecases/call_web_app_usecase.dart';
import 'package:renjuki2/features/homepage/domain/usecases/resume_usecase.dart';
import 'package:renjuki2/global/router/app_router.dart';
import 'package:renjuki2/global/services/network_services.dart';

import 'features/homepage/presentation/bloc/home_bloc/home_bloc.dart';

final sl = GetIt.I;

Future initSl() async {

  //services
  sl.registerLazySingleton<FireBaseAuthService>(() => FireBaseAuthService());

  //contorllers
  sl.registerFactory<AuthBloc>(
      () => AuthBloc(authUseCase: sl<AuthUseCase>()));
  // sl.registerFactory(() => AppRouterDelegate(homeBloc: sl<HomeBloc>(), authBloc: sl<AuthBloc>()));

  sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));
  //usecases

  sl.registerLazySingleton<AuthUseCase>(
      () => AuthUseCase(authRepository: sl()));

  sl.registerLazySingleton<CallFaceBookUsecase>(() => CallFaceBookUsecase(sl()));



  //domain

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryDataImp(sl<AuthUserData>()));
  sl.registerLazySingleton<CallAnyLinkRepoBase>(() => CallAnyLinkRepoImp(callAnyLinkData: sl()));



  //data
  sl.registerLazySingleton<AuthUserData>(() => AuthUserData(sl<FireBaseAuthService>()));
  sl.registerLazySingleton<CallLinkData>(() => CallLinkData());


}
