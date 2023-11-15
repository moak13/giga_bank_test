import 'package:flutter/services.dart';

class DashInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Check if the last entered character is a space
    if (newValue.text.isNotEmpty &&
        newValue.text.endsWith(' ') &&
        oldValue.text != newValue.text) {
      // Add ' - ' after the space
      return TextEditingValue(
        text: '${newValue.text} - ',
        selection: TextSelection.collapsed(
          offset: newValue.text.length + 3,
        ),
      );
    }

    return newValue;
  }
}
