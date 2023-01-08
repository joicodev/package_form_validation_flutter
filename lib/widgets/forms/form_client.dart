import 'package:create_validate_forms_app/widgets/components/text_field_base.dart';
import 'package:flutter/material.dart';

import '../../common/enums.dart';

class FormClient extends StatefulWidget {
  const FormClient({Key? key}) : super(key: key);

  @override
  State<FormClient> createState() => _FormClientState();
}

class _FormClientState extends State<FormClient> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passportController = TextEditingController();
  final TextEditingController _numberPhone = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _key,
          child: ListView(
            children: [
              TextFieldBase(
                text: 'Pasaporte',
                isRequired: false,
                type: TypeInput.passport,
                controller: _passportController,
                txtCapitalization: TextCapitalization.words,
              ),
              TextFieldBase(
                text: 'Código Postal',
                type: TypeInput.zipCode,
                controller: _zipCodeController,
              ),
              TextFieldBase(
                text: 'Correo electrónico',
                type: TypeInput.email,
                controller: _email,
              ),
              TextFieldBase(
                text: 'Número de teléfono',
                type: TypeInput.numberPhone,
                controller: _numberPhone,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: TextButton(
                  onPressed: _save,
                  child: const Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _save() {
    if (_key.currentState != null && _key.currentState!.validate()) {
      print("VALIDATEEE!");
    }
  }
}
