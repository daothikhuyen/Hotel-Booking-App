// validator for email
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';

String? validatorEmail(BuildContext context, String? value) {
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  if (value == null || value.isEmpty) {
    return context.l10n.errorEmptyEmail;
  } else if (!emailRegExp.hasMatch(value)) {
    return context.l10n.errorEmailFormat;
  }
  return null;
}

// validator for password
String? validatePassword(BuildContext context, String? value) {

  if (value == null || value.isEmpty) {
    return context.l10n.errorEmptyPassword;
  } else if (value.length < 8) {
    return context.l10n.errorPasswordFormat;
  }
  return null;
}
