class Validate {
  static validatePassport(String passport) {
    return RegExp(r'^(?!^0+$)[a-zA-Z0-9]{3,20}$').hasMatch(passport);
  }

  static validateNumberPhone(String numberPhone) {
    return RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(numberPhone);
  }

  static validateEmail(String email) {
    return RegExp(
      r'[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}',
    ).hasMatch(email);
  }

  static validateZipCode(String zipCode) {
    return RegExp(r'^\d{5}(?:[-\s]\d{4})?$').hasMatch(zipCode);
  }
}
