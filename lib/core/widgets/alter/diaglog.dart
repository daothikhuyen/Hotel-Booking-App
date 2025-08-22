import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';

class HBDiaglog {
  Future<void> diaglogBuilder(
    BuildContext context,
    String title,
    String desc,
    VoidCallback action,
  ) {
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
            TextButton(onPressed: () => action, child: Text(context.l10n.oK)),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.l10n.close),
            ),
          ],
        );
      },
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
