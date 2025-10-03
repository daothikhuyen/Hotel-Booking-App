import 'package:hotel_booking_app/ui/core/core.dart';

class HBSnackBar {
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          top: context.spacing.sm,
          left: context.spacing.lg,
          right: context.spacing.lg,
        ),
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
                padding: EdgeInsets.only(
                  left: context.spacing.lg,
                  bottom: context.spacing.xl,
                  top: context.spacing.lg,
                ),
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
