import 'package:dartz/dartz.dart';
import 'package:mfaf_cart_module/core/exception/failure.dart';
import 'package:mfaf_cart_module/core/util/types.dart';
import 'package:mfaf_cart_module/domain/entities/thailand_localtion.dart';

abstract class ThailandLocationRepository {
  Future<Either<Failure, List<ThailandLocation>>> getSuggestionLocations(
      String query, AddressSearchTypes addressSearchTypes);
}
