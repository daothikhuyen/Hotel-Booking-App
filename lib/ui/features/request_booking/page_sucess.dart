import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/ui/core/widgets/app_bar.dart';

class PageSucess extends StatelessWidget {
  const PageSucess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HBAppBar(
        isScrolled: false,
        title: context.l10n.titleCheckOut,
        color: context.colorScheme.onSurfaceVariant,
        onPressed: () => context.pop(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.images.sucess.path, fit: BoxFit.cover),

            Text(
              context.l10n.paymentComplete,
              style: HBTextStyles.headingThree(context.colorScheme.onSurface),
            ),
            const SizedBox(height: 10),
            Align(
              child: Text(
                context.l10n.contentPaymentComplete,
                style: HBTextStyles.bodyRegularMedium(
                  context.colorScheme.tertiary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
