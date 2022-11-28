import 'package:mfaf_cart_module/data/datasources/local_data_source.dart';
import 'package:mfaf_cart_module/domain/entities/thailand_localtion.dart';
import 'package:mfaf_cart_module/core/util/types.dart';
import 'package:mfaf_cart_module/core/exception/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mfaf_cart_module/domain/repositories/thailand_location_repository.dart';

class ThailandLocationRepositoryImpl implements ThailandLocationRepository {
  final LocalDataSource localDataSource;

  ThailandLocationRepositoryImpl({required this.localDataSource});
  @override
  Future<Either<Failure, List<ThailandLocation>>> getSuggestionLocations(
    String query,
    AddressSearchTypes addressSearchTypes,
  ) async {
    final result =
        await localDataSource.getSuggestionLocations(query, addressSearchTypes);
    final locations = result
        .map((e) => ThailandLocation(
              disctrict: e.amphoe,
              subDistrict: e.district,
              province: e.province,
              postalCode: e.zipcode,
            ))
        .toList();
    return Right(locations);
  }
}
