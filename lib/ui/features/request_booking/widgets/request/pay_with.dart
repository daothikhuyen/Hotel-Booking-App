import 'package:flutter/material.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/second_btn.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/ui/features/request_booking/widgets/items/item_counter.dart';

class PayWith extends StatefulWidget {
  const PayWith({
    required this.nameBank,
    required this.accountNumber,
    super.key,
  });

  final String nameBank;
  final String accountNumber;

  @override
  State<PayWith> createState() => _PayWithState();
}

class _PayWithState extends State<PayWith> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderCard(title: context.l10n.payWith, onPressed: () {}, titleBtn: ''),
        Container(
          height: 65,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(width: 1.01, color: context.colorScheme.outline),
            color: context.colorScheme.outline.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 4,
              top: 5,
              bottom: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ItemCounter(
                      icon: Assets.images.icon.emptyWallet,
                      color: context.colorScheme.inverseSurface,
                      background: context.colorScheme.onTertiary.withValues(
                        alpha: 0.1,
                      ),
                      size: 50,
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.nameBank,
                            style: HBTextStyles.title(
                              context.colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            widget.accountNumber,
                            style: HBTextStyles.bodyRegularSmall(
                              context.colorScheme.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SecondBtn(
                  titleBtn: context.l10n.edit,
                  color: context.colorScheme.primary,
                  onPressed: () {
                    //TODOS:...
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
