import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pharmacio_flutter_mobile/core/networking/api_services_impl.dart';
import 'package:pharmacio_flutter_mobile/core/networking/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/logic/cubits/auth_cubit.dart';
import '../../features/inventory/data/dataSources/inventory_remote_data_source.dart';
import '../../features/inventory/data/repos/inventory_repo.dart';
import '../../features/inventory/logic/cubits/inventory_cubit.dart';
import '../../features/offers/data/datasources/offers_remote_data_source.dart';
import '../../features/offers/data/repos/offers_repo.dart';
import '../../features/offers/logic/cubits/offers_cubit.dart';
import '../../features/notifications/data/datasources/notifications_remote_data_source.dart';
import '../../features/notifications/data/repos/notifications_repo.dart';
import '../../features/notifications/logic/cubits/notifications_cubit.dart';
import '../../features/proposal/data/datasources/proposals_remote_data_source.dart';
import '../../features/proposal/data/repos/proposals_repo.dart';
import '../../features/proposal/logic/cubits/proposals_cubit.dart';
import '../../features/sales/data/datasources/sales_remote_data_source.dart';
import '../../features/sales/data/repos/sales_repo.dart';
import '../../features/sales/logic/cubits/sales_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetit() async {
  // //! feature - auth

  //cubit
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
  //repo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(networkInfo: getIt(), authRemoteDataSource: getIt()),
  );
  //data source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiServicesImpl: getIt()),
  );

  //! feature - inventory

  //cubit
  getIt.registerFactory<InventoryCubit>(() => InventoryCubit(getIt()));
  //repo
  getIt.registerLazySingleton<InventoryRepo>(
    () =>
        InventoryRepo(networkInfo: getIt(), inventoryRemoteDataSource: getIt()),
  );
  //data source
  getIt.registerLazySingleton<InventoryRemoteDataSource>(
    () => InventoryRemoteDataSourceImpl(apiServicesImpl: getIt()),
  );

  //! feature - offers
  getIt.registerFactory<OffersCubit>(() => OffersCubit(getIt()));
  getIt.registerLazySingleton<OffersRepo>(
    () => OffersRepo(networkInfo: getIt(), offersRemoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<OffersRemoteDataSource>(
    () => OffersRemoteDataSourceImpl(apiServicesImpl: getIt()),
  );

  //! feature - proposals
  getIt.registerFactory<ProposalsCubit>(() => ProposalsCubit(getIt()));
  getIt.registerLazySingleton<ProposalsRepo>(
    () =>
        ProposalsRepo(networkInfo: getIt(), proposalsRemoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<ProposalsRemoteDataSource>(
    () => ProposalsRemoteDataSourceImpl(apiServicesImpl: getIt()),
  );

  //! feature - notifications
  getIt.registerFactory<NotificationsCubit>(() => NotificationsCubit(getIt()));
  getIt.registerLazySingleton<NotificationsRepo>(
    () => NotificationsRepo(
      networkInfo: getIt(),
      notificationsRemoteDataSource: getIt(),
    ),
  );
  getIt.registerLazySingleton<NotificationsRemoteDataSource>(
    () => NotificationsRemoteDataSourceImpl(apiServicesImpl: getIt()),
  );

  //! feature - sales
  getIt.registerFactory<SalesCubit>(() => SalesCubit(getIt()));
  getIt.registerLazySingleton<SalesRepo>(
    () => SalesRepo(networkInfo: getIt(), salesRemoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<SalesRemoteDataSource>(
    () => SalesRemoteDataSourceImpl(apiServicesImpl: getIt()),
  );

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
}
