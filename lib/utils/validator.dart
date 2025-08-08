// validator for email
String? validatorEmail(String? value) {
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  if (value == null || value.isEmpty) {
    return 'Please entern your email';
  } else if (!emailRegExp.hasMatch(value)) {
    return 'Invalid email format';
  }
  return null;
}

// validator for password
String? validatePassword(String? value) {

  if (value == null || value.isEmpty) {
    return 'Please entern your password';
  } else if (value.length < 8) {
    return 'Password must be at least 6 characters long';
  }
  return null;
}