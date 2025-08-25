import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';

class HBSnackBar {
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
        action: SnackBarAction(label: context.l10n.oK, onPressed: () {}),
      ),
    );
  }

  void showOverlayMessage(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Material(
              child: Container(
                padding: const EdgeInsets.only(left: 18, bottom: 25, top: 15),
                decoration: BoxDecoration(color: context.colorScheme.onSurface),
                child: Text(
                  message,
                  style: HBTextStyles.bodyMediumSmall(
                    context.colorScheme.onSecondary,
                  ),
                ),
              ),
            ),
          ),
    );

    overlay.insert(overlayEntry);

    // Auto hide after 2 seconds
    Future.delayed(const Duration(seconds: 2), overlayEntry.remove);
  }
}
