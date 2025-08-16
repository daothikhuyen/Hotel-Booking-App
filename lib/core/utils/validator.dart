// validator for email
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';

String? validatorEmail(BuildContext context, String? value) {
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.errorEmptyEmail;
  } else if (!emailRegExp.hasMatch(value)) {
    return AppLocalizations.of(context)!.errorEmailFormat;
  }
  return null;
}

// validator for password
String? validatePassword(BuildContext context, String? value) {

  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.errorEmptyPassword;
  } else if (value.length < 8) {
    return AppLocalizations.of(context)!.errorPasswordFormat;
  }
  return null;
}