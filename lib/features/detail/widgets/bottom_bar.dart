import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/features/detail/detail_screen.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';

class ButtomBar extends StatelessWidget {
  const ButtomBar({
    super.key,
    required this.widget,
  });

  final DetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          border: Border(
            top: BorderSide(
              width: 0.5,
              color: context.colorScheme.outline,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.onTertiary,
              offset: Offset(0, -1),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        height: 90,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                     AppLocalizations.of(context)!.price,
                    style: CustomTextStyles.bodyRegularSmall(
                      context.colorScheme.tertiary,
                    ),
                  ),
                  widget.hotel.current_price != 0 ? Text(
                    '\$${widget.hotel.current_price}00',
                    style: CustomTextStyles.headingThree(
                      context.colorScheme.inverseSurface,
                    ),
                  ): Skeleton(width: 7, height: 30),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: PrimaryBtn(
                textButton:  AppLocalizations.of(context)!.buttonBooking,
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
