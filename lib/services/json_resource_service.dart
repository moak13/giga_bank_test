import 'dart:convert';

import 'package:flutter/services.dart';

import '../app/app.logger.dart';
import '../data_model/country.dart';
import '../data_model/coutries_response.dart';

class JsonResourceService {
  final _logger = getLogger('JsonResourceService');

  Future<List<Country>?> loadCountries() async {
    try {
      String jsonString =
          await rootBundle.loadString("assets/json/countries.json");
      final json = jsonDecode(jsonString);
      final CountriesResponse countryResponse =
          CountriesResponse.fromJson(json);
      return countryResponse.countries;
    } catch (e, s) {
      _logger.e('error trying to fetch countries from local json file', e, s);
      return null;
    }
  }
}
