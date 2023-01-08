import 'package:flutter/services.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  UpperCaseTextFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: _capitalize(newValue.text),
      selection: newValue.selection,
    );
  }

  String _capitalize(String value) {
    return value.trim().isEmpty ? "" : value.trim().toUpperCase();
  }
}
