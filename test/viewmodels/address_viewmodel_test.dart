import 'package:flutter_test/flutter_test.dart';
import 'package:giga_bank_test/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AddressViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
