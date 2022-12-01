String? validateInteger(final String? value) {
  if (value == null) {
    return null;
  }

  if (int.tryParse(value) == null) {
    return 'Please enter a valid number without decimals.';
  }

  return null;
}

String? validateEmail(final String? value) {
  final RegExp emailReg = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  if (value == null || value.isEmpty) {
    return 'please enter the email';
  } else if (!emailReg.hasMatch(value)) {
    return 'you need to insert an email';
  }

  return null;
}

String? validatePassword(final String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter the password';
  } else if (value.length < 8) {
    return 'password must be at least 8 characters';
  }

  return null;
}

String? validateTermsAccepted(final bool? value) {
  if (value == false || value == null) {
    return 'You have to accept the Legal Conditions';
  }

  return null;
}

String? validateRequired(final String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter the field';
  }

  return null;
}
