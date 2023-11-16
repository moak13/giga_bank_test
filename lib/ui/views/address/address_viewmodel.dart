import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../data_model/address.dart';
import '../../../data_model/country.dart';
import '../../../services/json_resource_service.dart';
import '../../common/string_util.dart';
import 'address_view.form.dart';

class AddressViewModel extends FutureViewModel<List<Country>?>
    with FormStateHelper
    implements FormViewModel {
  final _jsonResourceService = locator<JsonResourceService>();
  final _logger = getLogger('AddressViewModel');

  List<Country> _memoryList = [];

  Country? _country;
  Country? get country => _country;

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
    if (StringUtil.isEmpty(query)) {
      return const Iterable<Country>.empty();
    }

    final List<Country> searchList = List.from(_memoryList);

    return searchList.where((Country country) {
      return country.name!.toLowerCase().contains(query!.toLowerCase());
    });
  }

  Future<void> submit() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 3));
    Address address = Address(
      country: _country?.name ?? '',
      prefecture: prefectureValue,
      municipality: municipalityValue,
      street: streetValue,
      apartment: apartmentValue,
    );
    setBusy(false);
    _logger.i(address.toJson());
  }

  bool get isValidForm {
    if (StringUtil.isEmpty(_country?.name) &&
        StringUtil.isEmpty(prefectureValue) &&
        StringUtil.isEmpty(municipalityValue) &&
        StringUtil.isEmpty(streetValue) &&
        StringUtil.isEmpty(apartmentValue)) {
      return true;
    }

    return false;
  }

  @override
  Future<List<Country>?> futureToRun() async {
    final countries = await _getCountries();
    return countries?.toList();
  }
}
