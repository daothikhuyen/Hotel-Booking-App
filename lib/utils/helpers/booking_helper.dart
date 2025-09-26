import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/data/model/user.dart';
import 'package:hotel_booking_app/ui/features/auth/view_model/auth_controller.dart';

double calculatorNightlyRate(double priceHotel, int numberNight) {
  return priceHotel * numberNight;
}

double calculatorServiceFee(int guests) {
  return guests * 5;
}

double calculatorTotalPrice(
  double nightlyRate,
  double cleaningFee,
  double serviceFee,
) {
  return nightlyRate + cleaningFee + serviceFee;
}

Booking buildBooking(
  Hotel hotel,
  DateTime formatStartDate,
  DateTime formatEndDate,
  int? numberGuest,
  AuthController userProvider,
  int? nightCount,
) {
  const double cleaningFee = 5;

  final nightlyRate = calculatorNightlyRate(
    hotel.currentPrice ?? 0,
    nightCount ?? 0,
  );
  final svcFee = calculatorServiceFee(numberGuest ?? 0);
  final total = calculatorTotalPrice(nightlyRate, cleaningFee, svcFee);
  final user =
      userProvider.currentUser ?? HBUser(uid: '', email: '', displayName: '');

  return Booking(
    hotel: hotel,
    user: user,
    checkIn: formatStartDate,
    checkOut: formatEndDate,
    guests: numberGuest ?? 0,
    cleaningFee: cleaningFee,
    serviceFee: svcFee,
    totalPrice: total,
    nightlyRate: nightlyRate,
    uid: '',
  );
}
