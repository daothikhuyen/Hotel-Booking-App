
import 'package:hotel_booking_app/core/response/api_status.dart';

class ApiResponse<T> {
  ApiResponse(this.status, {this.message = '', this.code = 200, this.data});

  final ApiStatus status;
  final int? code;
  final String message;
  final dynamic data;
}
