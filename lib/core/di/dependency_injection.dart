import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pharmacio_flutter_mobile/core/networking/api_services_impl.dart';
import 'package:pharmacio_flutter_mobile/core/networking/network_info.dart';
import 'package:pharmacio_flutter_mobile/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:pharmacio_flutter_mobile/features/profile/data/repos/profile_repo.dart';
import 'package:pharmacio_flutter_mobile/features/profile/data/repos/profile_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/data/data_source/proposals_remote_data_source.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/data/data_source/proposals_remote_data_source_impl.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/data/repos/proposals_repo.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/data/repos/proposals_repo_impl.dart';

final getIt = GetIt.instance;

Future<void> setupGetit() async {
  // //! feature - auth (login)

  //cubit
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // //repo
  // getIt.registerLazySingleton<LoginRepo>(
  //   () => LoginRepo(networkInfo: getIt(), loginRemoteDataSource: getIt()),
  // );
  // //data source
  // getIt.registerLazySingleton<LoginRemoteDataSource>(
  //   () => LoginRemoteDataSourceImp(apiServicesImpl: getIt()),
  // );

  //! Core

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImp(internetConnectionChecker: getIt()),
  );

  getIt.registerLazySingleton(() => ApiServicesImpl());

  //! External

  final sharedPreference = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreference);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => InternetConnectionChecker.createInstance());
  //proposals
  getIt.registerLazySingleton<ProposalsRemoteDataSource>(
    () => ProposalsRemoteDataSourceImpl(getIt<ApiServicesImpl>()),
  );

  getIt.registerLazySingleton<ProposalsRepo>(
    () => ProposalsRepoImpl(
      remoteDataSource: getIt<ProposalsRemoteDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );
  // DataSource
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(getIt<ApiServicesImpl>()),
  );

  // Repo
  getIt.registerLazySingleton<ProfileRepo>(
    () =>
        ProfileRepoImpl(getIt<ProfileRemoteDataSource>(), getIt<NetworkInfo>()),
  );
}
