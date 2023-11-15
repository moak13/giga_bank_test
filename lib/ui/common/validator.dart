import '../../app/app.logger.dart';
import 'string_util.dart';

class Validator {
  static final _logger = getLogger('Validator');
  static String? validateField(String? s, {String? error}) {
    if (StringUtil.isEmpty(s)) {
      return error;
    } else {
      return null;
    }
  }

  static String? validateStreet(String? s) {
    String? newString = s?.trim().replaceAll(' ', '');
    _logger.i(newString);

    if (StringUtil.isEmpty(newString)) {
      return 'subarea is required';
    }
    List<String?> paths = newString!.split('-');
    _logger.i(paths);

    if (paths.length == 1) {
      return 'block is required';
    } else if (paths.length == 2) {
      return 'house is required';
    } else {
      return null;
    }
  }
}
