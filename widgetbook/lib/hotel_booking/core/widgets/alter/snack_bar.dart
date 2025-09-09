import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:hotel_booking_app/core/widgets/alter/snack_bar.dart';

@widgetbook.UseCase(name: 'Default', type: HBSnackBar)
Widget hbSnackBarUseCase(BuildContext context) {
  final snackBar = HBSnackBar();

  return Scaffold(
    appBar: AppBar(title: const Text('HBSnackBar Demo')),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              snackBar.showSnackBar(context, 'SnackBar');
            },
            child: const Text('SnackBar'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              snackBar.showOverlayMessage(
                context,
                context.l10n.overlayMessage,
              );
            },
            child: Text(context.l10n.overlayMessage),
          ),
        ],
      ),
    ),
  );
}
