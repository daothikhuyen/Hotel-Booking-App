import 'package:intl/intl.dart';

String formatPrice(double amount) {
  final formatter = NumberFormat.currency(
    locale: 'en',
    symbol: r'$',
    decimalDigits: 0,
  );
  return formatter.format(amount);
}

String formatBookingDate(DateTime checkIn, DateTime checkOut) {
  final dayFormat = DateFormat('d');
  final monthFormat = DateFormat('MMM');
  final yearFormat = DateFormat('y');

  if (checkIn.year != checkOut.year || checkIn.month != checkOut.month) {
    return '${DateFormat('MMM dd, yyyy').format(checkIn)} '
        '- ${DateFormat('MMM dd, yyyy').format(checkOut)}';
  } else {
    return '${dayFormat.format(checkIn)}-${dayFormat.format(checkOut)} '
        '${monthFormat.format(checkIn)} ${yearFormat.format(checkIn)}';
  }
}
