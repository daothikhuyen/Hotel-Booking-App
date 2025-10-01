import 'package:flutter/material.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/ui/features/request_booking/widgets/items/item_counter.dart';

class CounterCard extends StatefulWidget {
  const CounterCard({super.key, this.guestNumber});

  final void Function(int number)? guestNumber;

  @override
  State<CounterCard> createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  late int guestCount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: context.spacing.lg),
          child: HeaderCard(
            title: context.l10n.guest,
            onPressed: () {},
            titleBtn: '',
          ),
        ),
        Row(
          children: [
            ItemCounter(
              icon: Assets.images.icon.akarIconsMinus,
              color: context.colorScheme.primary,
              background: context.colorScheme.secondary,
              size: 30,
              onPressed: () {
                setState(() {
                  if (guestCount > 0) guestCount -= 1;
                  widget.guestNumber?.call(guestCount);
                });
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.spacing.lg),
              child: Text(
                guestCount.toString(),
                style: HBTextStyles.bodySemiboldLarge(
                  context.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            ItemCounter(
              icon: Assets.images.icon.plus,
              color: context.colorScheme.onSecondary,
              background: context.colorScheme.primary,
              size: 30,
              onPressed: () {
                setState(() {
                  guestCount += 1;
                   widget.guestNumber?.call(guestCount);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
