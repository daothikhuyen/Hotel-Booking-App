// validator for email
import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// validator for text
bool validateForm(GlobalKey<FormState> formKey) {

  if(!formKey.currentState!.validate()) {
    return false;
  }

  return true;

}

String? validateText(BuildContext context, String? value, String errorMessage) {
  if (value == null || value.isEmpty) {
    return errorMessage;
  }
  return null;
}

String? validateEmail(BuildContext context, String? value) {
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  final result = validateText(context, value, context.l10n.errorEmptyEmail);
  if (result == null || result.isEmpty) {
    if (!emailRegExp.hasMatch(value ?? '')) {
      return context.l10n.errorEmailFormat;
    }
  }
  return result;
}

// validator for password
String? validatePassword(BuildContext context, String? value) {
  final passwordRegExp = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );

  final result = validateText(context, value, context.l10n.errorEmptyPassword);
  if (result == null || result.isEmpty) {
    if (!passwordRegExp.hasMatch(value ?? '')) {
      return context.l10n.errorPasswordFormat;
    }
  }
  return result;
}

// validator for numberPhone
String? validateNumberPhone(
  BuildContext context,
  String? numberPhone,
  PhoneNumber selectedNumber,
) {
  final phoneRegExp = RegExp(r'^(\+|00)[0-9]{10,11}$');
  final result = validateText(context, numberPhone, context.l10n.errorNotEmpty);
  if (result == null || result.isEmpty) {
    if (!phoneRegExp.hasMatch(numberPhone ?? '')) {
      return context.l10n.errorNumberPhone;
    }
  }
  return null;
}
