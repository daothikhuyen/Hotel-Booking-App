import 'package:hotel_booking_app/ui/core/core.dart';
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
          height: 55.h,
          margin: EdgeInsets.only(bottom: context.spacing.sm.h),
          decoration: BoxDecoration(
            border: Border.all(width: 1.01, color: context.colorScheme.outline),
            color: context.colorScheme.outline.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: context.spacing.allXs.h,
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
                      size: 40.h,
                      onPressed: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w),
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
