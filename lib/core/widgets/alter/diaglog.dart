import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';

class HBDiaglog {
  Future<void> diaglogBuilder({
    required BuildContext context,
    required String title,
    required String desc,
    required bool isAction,
    required bool isClose,
    required VoidCallback action,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        final actionsList = <Widget>[];

        if (isAction) {
          actionsList.add(
            TextButton(onPressed: action, child: Text(context.l10n.oK)),
          );
        }

        if (isClose) {
          actionsList.add(
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.l10n.close),
            ),
          );
        }

        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(color: context.colorScheme.onSurfaceVariant),
          ),
          content: Text(
            desc,
            style: TextStyle(color: context.colorScheme.onSurfaceVariant),
          ),
          actions: [...actionsList],
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
