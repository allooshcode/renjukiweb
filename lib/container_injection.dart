import 'package:get_it/get_it.dart';
import 'package:renjuki2/features/authentication/data/data_sources/auth_user_data.dart';
import 'package:renjuki2/features/authentication/data/repository/auth_repository_data_imp.dart';
import 'package:renjuki2/features/authentication/domain/repository/auth_Repository.dart';
import 'package:renjuki2/features/authentication/domain/usecases/auth_usecase.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:renjuki2/features/categories/web/data/remote_data_source/category_data.dart';
import 'package:renjuki2/features/categories/web/data/repository/category_repository_data.dart';
import 'package:renjuki2/features/categories/web/domain/repository/category_domain_repository.dart';
import 'package:renjuki2/features/categories/web/domain/usecases/category_fetching_usecase.dart';
import 'package:renjuki2/features/categories/web/presentation/bloc/category_bloc.dart';
import 'package:renjuki2/features/homepage/data/datasources/call_any_link_data.dart';
import 'package:renjuki2/features/homepage/data/repositories/call_any_link_repo_imp.dart';
import 'package:renjuki2/features/homepage/domain/repositories/call_link_repo.dart';
import 'package:renjuki2/features/homepage/domain/usecases/call_web_app_usecase.dart';
import 'package:renjuki2/features/productspage/data/data_sources/remote_data/product_data_remote_source.dart';
import 'package:renjuki2/features/productspage/data/repository/product_data_repository.dart';
import 'package:renjuki2/features/productspage/domain/repository/product_repository.dart';
import 'package:renjuki2/features/productspage/domain/usecases/fetch_products_usecase.dart';
import 'package:renjuki2/features/productspage/presentation/bloc/product_events.dart';
import 'package:renjuki2/global/services/network_services.dart';

import 'features/homepage/presentation/bloc/home_bloc/home_bloc.dart';
import 'features/productspage/presentation/bloc/product_bloc.dart';

final sl = GetIt.I;

Future initSl() async {
  //services
  sl.registerLazySingleton<FireBaseStorage>(() => FireBaseStorage());
  sl.registerLazySingleton<FirebaseFireService>(() => FirebaseFireService());
  sl.registerLazySingleton<FireBaseAuthService>(() => FireBaseAuthService());

  //contorllers

  sl.registerLazySingleton<ProductBloc>(() =>
      ProductBloc(fetchProductsUseCase: sl(), fetchProductDetailsUseCase: sl())
        ..add(FetchProductsEvent()));

  sl.registerFactory<AuthBloc>(() => AuthBloc(authUseCase: sl<AuthUseCase>()));
  // sl.registerFactory(() => AppRouterDelegate(homeBloc: sl<HomeBloc>(), authBloc: sl<AuthBloc>()));

  sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));
  sl.registerFactory<CategoryBloc>(() => CategoryBloc(sl()));

  //usecases

  sl.registerLazySingleton(
      () => CategoryFetchingUsecase(categoryFetchRepsitory: sl()));

  sl.registerLazySingleton(() => FetchProductsUseCase(repository: sl()));
  sl.registerLazySingleton(() => FetchProductDetailsUseCase(repository: sl()));

  sl.registerLazySingleton<AuthUseCase>(
      () => AuthUseCase(authRepository: sl()));

  sl.registerLazySingleton<CallFaceBookUsecase>(
      () => CallFaceBookUsecase(sl()));

  //domain

  sl.registerLazySingleton<CategoryDomainRepsitory>(
      () => CategoryRepositoryData(categoryData: sl()));

  sl.registerLazySingleton<ProductRepository>(() => ProductDataRepository(
      productDataRemoteSource: sl<ProductDataRemoteSource>()));

  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryDataImp(sl<AuthUserData>()));
  sl.registerLazySingleton<CallAnyLinkRepoBase>(
      () => CallAnyLinkRepoImp(callAnyLinkData: sl()));

  //data
  sl.registerLazySingleton(
      () => CategoryData(fireStore: sl<FirebaseFireService>()));
  sl.registerLazySingleton(() => ProductDataRemoteSource());
  sl.registerLazySingleton<AuthUserData>(
      () => AuthUserData(sl<FireBaseAuthService>()));
  sl.registerLazySingleton<CallLinkData>(() => CallLinkData());
}
