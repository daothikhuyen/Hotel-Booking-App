import 'package:intl/intl.dart';

String formatCurrency(double amount) {
  final formatter = NumberFormat.currency(
    locale: 'en',
    symbol: r'$', 
    decimalDigits: 0, 
  );
  return formatter.format(amount);
}
