class AppValidators {
  static String? validateEmail(String? emailValue) {
    if (emailValue == null || emailValue.isEmpty) {
      return "Email is required";
    }
    //regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(emailValue)) {
      //if it does not match this pattern
      return 'Invalid email address';
    }

    return null;
  }

  static String? validatePassword(String? passwordValue) {
    if (passwordValue == null || passwordValue.isEmpty) {
      return "password is required";
    }

    if (passwordValue.length <= 3) {
      return "password must be greater than 3";
    }

    //check for uppercase letters
    if (!passwordValue.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    //check for uppercase letters
    if (!passwordValue.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  static String? validateConfirmPassword(
    String? passwordValue,
    String newPasswordValue,
  ) {
    if (passwordValue == null || passwordValue.isEmpty) {
      return "password is required";
    }

    if (passwordValue.length <= 3) {
      return "password must be greater than 3";
    }

    if (passwordValue != newPasswordValue) {
      return "New password must be same as confirm password";
    }

    return null;
  }

  static String? validateTextInput({
    required String? value,
    required String fieldName,
  }) {
    if (value == null || value.isEmpty) {
      return "$fieldName is requird";
    }
    return null;
  }

  static String? validatePriceField(String? priceText,
      {required String fieldName}) {
    if (priceText == null || priceText.isEmpty) {
      return "$fieldName is required";
    }

    if (!priceText.contains(RegExp(r'^\d+(\.\d*)?$'))) {
      return "$fieldName must be decimal digit";
    }

    return null;
  }

  static String? validateTextField(String? addressText,
      {required String fieldName}) {
    if (addressText == null || addressText.isEmpty) {
      return "$fieldName is required";
    }

    return null;
  }

  static String? validateAccountNumber( String? accountNumber) {
    if ( accountNumber == null ||  accountNumber.isEmpty) {
      return "Account number is required";
    }

    if (accountNumber.length < 10 || accountNumber.length > 10) {
      return "Account number must be 10 digits";
    }

    return null;
  }
}
