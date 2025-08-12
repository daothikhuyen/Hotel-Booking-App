import 'package:flutter/material.dart';
import 'package:hotel_booking_app/screens/auth/sign_in.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: SignIn)
Widget buildSignInUseCase(BuildContext context) {
  return Center(
    child: SignIn(),
  );
}