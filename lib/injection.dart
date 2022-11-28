import 'package:get_it/get_it.dart';
import 'package:mfaf_cart_module/core/widgets/cubit/textfield_valid_cubit/cubit/textfield_valid_cubit.dart';
import 'package:mfaf_cart_module/data/datasources/local_data_source.dart';
import 'package:mfaf_cart_module/data/repositories/thailand_location_repository_impl.dart';
import 'package:mfaf_cart_module/domain/repositories/thailand_location_repository.dart';
import 'package:mfaf_cart_module/domain/usecases/get_thailand_location.dart';
import 'package:mfaf_cart_module/presentation/bloc/address_query_bloc/address_query_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => AddressQueryBloc(locator()));

  // cubit
  locator.registerFactory(() => TextfieldValidCubit());

  // usecase
  locator.registerLazySingleton(() => GetThailandLocation(locator()));

  // repository
  locator.registerLazySingleton<ThailandLocationRepository>(
    () => ThailandLocationRepositoryImpl(
      localDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(),
  );
}
