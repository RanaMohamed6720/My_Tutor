class Validation {
  String? validateEmail(value) {
    print('object');
    if (value.toString().isEmpty || value == null) {
      return 'Please enter an email';
    }
    RegExp emailRegExp =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value.toString().isEmpty || value == null) {
      return 'Please enter a password';
    }
    if (value.toString().length < 8) {
      return 'Password is weak';
    }
    return null;
  }

  String? validatePhoneNo(value) {
    if (value.toString().isEmpty || value == null) {
      return 'Please enter a phone no.';
    }
    if (value.toString().length != 11) {
      return 'Please enter a 10-digit phone no.';
    }
    RegExp phoneRegExp = RegExp(r'^01[0125][0-9]{8}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid phone no.';
    }
    return null;
  }

  String? validateConfirmedPassword(value, password) {
    if (value.toString().isEmpty || value == null) {
      return 'Please confirm your password';
    }
    if (value.toString() != password) {
      return 'Password doesn\'t match';
    }
    return null;
  }
}
