import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../data_model/country.dart';
import '../../../services/json_resource_service.dart';

class AddressViewModel extends FutureViewModel<List<Country>?>
    with FormStateHelper
    implements FormViewModel {
  final _jsonResourceService = locator<JsonResourceService>();
  final _logger = getLogger('AddressViewModel');

  List<Country> _memoryList = [];

  Country? _country;

  void setSelectedCountry(Country country) {
    _country = country;
  }

  Future<Iterable<Country>?> _getCountries() async {
    try {
      List<Country>? countries = await _jsonResourceService.loadCountries();

      if (countries == null) {
        return const Iterable<Country>.empty();
      }

      _memoryList = countries;
      return countries;
    } catch (e) {
      _logger.e('error trying to fetch country');
      return const Iterable<Country>.empty();
    }
  }

  Future<Iterable<Country>> search(String? query) async {
    if (query == null && query!.isEmpty) {
      return const Iterable<Country>.empty();
    }

    final List<Country> searchList = List.from(_memoryList);

    return searchList.where((Country country) {
      return country.name!.toLowerCase().contains(query.toLowerCase());
    });
  }

  void submit() {}

  @override
  Future<List<Country>?> futureToRun() async {
    final countries = await _getCountries();
    return countries?.toList();
  }
}
