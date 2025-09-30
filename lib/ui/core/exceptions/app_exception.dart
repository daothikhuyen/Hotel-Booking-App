import 'package:hotel_booking_app/ui/core/exceptions/error_type.dart';

class AppException implements Exception {
  AppException({
    required this.type,
    required this.message,
    this.code,
    this.details,
  });

  final int? code;
  final String message;
  final dynamic details;
  final ErrorType type;

  @override
  String toString() {
    return 'AppException(code: $code, message: $message, details: $details)';
  }
}
