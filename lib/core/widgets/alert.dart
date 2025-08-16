import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';

class Alert {
  Future<void> diaglogBuilder(BuildContext context, String title, String desc) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(color: context.colorScheme.onSurfaceVariant),
          ),
          content: Text(
            desc,
            style: TextStyle(color: context.colorScheme.onSurfaceVariant),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(label: 'Oki', onPressed: () {}),
      ),
    );
  }

  void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
