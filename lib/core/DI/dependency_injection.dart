import 'package:dio/dio.dart';
import 'package:fruit_market_app/Features/Auth/domain/repostries/auth_repo.dart';
import 'package:fruit_market_app/Features/Auth/domain/repostries/auth_repo_impl.dart';
import 'package:fruit_market_app/Features/Auth/domain/repostries/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

import 'dio_factory_logger.dart';

final getIt = GetIt.instance;
void initGetIt() {
  // Dio dio = DioFactory.getDio();
  // singleton is the used of method we take acopy of it many times so we make it one time and reused it  /// here a singleton for apiservice
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpi(
    getIt.get<FirebaseAuthService>(),
  ));

  /// here a singleton for apiservice

  // login
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  // signup
  // getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  // getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));

  // // specialization
  // getIt.registerLazySingleton<SpecializationRepo>(() => SpecializationRepo(getIt()));
}
