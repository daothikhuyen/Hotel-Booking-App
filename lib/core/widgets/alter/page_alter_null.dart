import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';

class PageAlterNull extends StatelessWidget {
  const PageAlterNull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(child: Text(context.l10n.noData)),
  );
  }
}
