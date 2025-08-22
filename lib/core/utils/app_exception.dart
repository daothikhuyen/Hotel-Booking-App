class AppException implements Exception {
  AppException({ required this.message, this.code ,this.details});

  final int? code;
  final String message;
  final dynamic details;

  @override
  String toString() {
    return 'AppException(code: $code, message: $message, details: $details)';
  }
}
