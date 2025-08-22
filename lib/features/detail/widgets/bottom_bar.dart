import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/features/detail/detail_screen.dart';

class ButtomBar extends StatelessWidget {
  const ButtomBar({
    required this.widget,
    super.key,
  });

  final DetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          border: Border(
            top: BorderSide(
              width: 0.5,
              color: context.colorScheme.outline,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.onTertiary,
              offset: const Offset(0, -1),
              blurRadius: 10,
            ),
          ],
        ),
        height: 90,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                     context.l10n.price,
                    style: HBTextStyles.bodyRegularSmall(
                      context.colorScheme.tertiary,
                    ),
                  ),
                  if (widget.hotel.currentPrice != 0) Text(
                    context.l10n.currentPrice(widget.hotel.currentPrice?? 0),
                    style: HBTextStyles.headingThree(
                      context.colorScheme.inverseSurface,
                    ),
                  ) else const Skeleton(width: 7, height: 30),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: PrimaryBtn(
                textButton:  context.l10n.buttonBooking,
                onPressed: () {},
                bold: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
