import 'package:create_validate_forms_app/common/enums.dart';
import 'package:create_validate_forms_app/common/validate.dart';
import 'package:create_validate_forms_app/widgets/components/upper_case_text_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldBase extends StatelessWidget {
  final String text;
  final TypeInput? type;
  final isRequired;
  final TextEditingController controller;
  final TextCapitalization txtCapitalization;

  const TextFieldBase({
    Key? key,
    this.type,
    required this.text,
    this.isRequired = true,
    required this.controller,
    this.txtCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: _validateLength,
      keyboardType: _keyboardType,
      textCapitalization: txtCapitalization,
      inputFormatters: _validateInputFormatter,
      decoration: InputDecoration(label: Text(text)),
      validator: (String? value) {
        print("value $value");
        if ((value == null || value.isEmpty) && !isRequired) {
          return null;
        }

        return _validateStructure(value ?? "");
      },
    );
  }

  TextInputType get _keyboardType {
    switch (type) {
      case TypeInput.numberPhone:
        return TextInputType.number;
      case TypeInput.zipCode:
        return TextInputType.number;
      case TypeInput.email:
        return TextInputType.emailAddress;
      default:
        return TextInputType.text;
    }
  }

  int? get _validateLength {
    switch (type) {
      case TypeInput.passport:
        return 9;
      case TypeInput.numberPhone:
        return 15;
      case TypeInput.email:
        return 64;
      case TypeInput.zipCode:
        return 5;
      default:
        return null;
    }
  }

  List<TextInputFormatter>? get _validateInputFormatter {
    switch (type) {
      case TypeInput.passport:
        return [UpperCaseTextFormatter()];
      case TypeInput.numberPhone:
        return [FilteringTextInputFormatter.digitsOnly];
      case TypeInput.zipCode:
        return [FilteringTextInputFormatter.digitsOnly];
      default:
        return [FilteringTextInputFormatter.singleLineFormatter];
    }
  }

  String? _validateStructure(String value) {
    if (isRequired && value.isEmpty) {
      return "El campo $text es requerido";
    }

    switch (type) {
      case TypeInput.passport:
        final isValid = Validate.validatePassport(value);
        return isValid ? null : "El pasaporte es incorrecto";
      case TypeInput.numberPhone:
        final isValid = Validate.validateNumberPhone(value);
        return isValid ? null : "Número de teléfono es incorrecto";
      case TypeInput.email:
        final isValid = Validate.validateEmail(value);
        return isValid ? null : "Correo electrónico es incorrecto";
      case TypeInput.zipCode:
        final isValid = Validate.validateZipCode(value);
        return isValid ? null : "Código Postal es incorrecto";
      default:
        return null;
    }
  }
}
