import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/data/repositories/api_response.dart';
import 'package:hotel_booking_app/data/services/booking_service.dart';
import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/exceptions/app_exception.dart';

class BookingController extends ChangeNotifier {
  final user = FirebaseAuth.instance.currentUser;
  final _service = BookingService();

  Future<ApiResponse> createBooking(
    BuildContext context,
    Booking booking,
  ) async {
    try {
      if (user == null) {
        return ApiResponse(
          ApiStatus.error,
          message: context.l10n.userNotExisted,
        );
      }
      await _service.saveBooking(context, booking);

      return ApiResponse(ApiStatus.success);
    } on AppException catch (e) {
      return ApiResponse(ApiStatus.error, message: e.message);
    }
  }
}
