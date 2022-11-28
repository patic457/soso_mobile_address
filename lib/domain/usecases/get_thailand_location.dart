import 'package:dartz/dartz.dart';
import 'package:mfaf_cart_module/core/exception/failure.dart';
import 'package:mfaf_cart_module/core/util/types.dart';
import 'package:mfaf_cart_module/domain/entities/thailand_localtion.dart';
import 'package:mfaf_cart_module/domain/repositories/thailand_location_repository.dart';

class GetThailandLocation {
  final ThailandLocationRepository repository;

  GetThailandLocation(this.repository);
  Future<Either<Failure, List<ThailandLocation>>> execute(
      String query, AddressSearchTypes addressSearchTypes) {
    return repository.getSuggestionLocations(query, addressSearchTypes);
  }
}
