import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:mfaf_cart_module/core/util/types.dart';
import 'package:mfaf_cart_module/data/models/thailand_localtion.dart';

List<ThailandLocation> localtions = [];

abstract class LocalDataSource {
  Future<List<ThailandLocation>> getSuggestionLocations(
      String query, AddressSearchTypes addressSearchTypes);
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<List<ThailandLocation>> getSuggestionLocations(
      String query, AddressSearchTypes addressSearchTypes) async {
    var localtions = await _readLocationJson();
    return List.of(localtions).where((element) {
      final String addressLower;
      switch (addressSearchTypes) {
        case AddressSearchTypes.subDistrict:
          {
            addressLower = element.district.toString().toLowerCase();
          }
          break;
        case AddressSearchTypes.district:
          {
            addressLower = element.amphoe.toString().toLowerCase();
          }
          break;

        case AddressSearchTypes.province:
          {
            addressLower = element.province.toString().toLowerCase();
          }
          break;
        case AddressSearchTypes.postalCode:
          {
            addressLower = element.zipcode.toString().toLowerCase();
          }
          break;
      }

      final queryLower = query.toLowerCase();
      return addressLower.startsWith(queryLower);
    }).toList();
  }

  static Future<List<ThailandLocation>> _readLocationJson() async {
    if (localtions.isNotEmpty) {
      log('Already load location. lets fire!');
      return localtions;
    }
    log('Init location.');

    final String response =
        await rootBundle.loadString('assets/data/thailand_locations.json');

    final json = jsonDecode(response);

    localtions = json
        .map<ThailandLocation>((e) => ThailandLocation.fromJson(e))
        .toList();

    return localtions;
  }
}
