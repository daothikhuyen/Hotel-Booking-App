import 'dart:io';

import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/ui/core/exceptions/error_type.dart';

class NetworkUtil {
  static Future<bool> hasNetwork(BuildContext context) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException {
      throw AppException(
        type: ErrorType.network,
        message: context.l10n.notInternet,
      );
    }
  }
}
