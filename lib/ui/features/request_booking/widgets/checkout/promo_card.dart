import 'package:hotel_booking_app/ui/core/core.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.promo,
          style: HBTextStyles.bodyMediumLarge(
            context.colorScheme.onSurface,
          ),
        ),
    
        Container(
          margin: EdgeInsets.only(top: context.spacing.lg),
          width: double.infinity,
          height: 52,
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            border: Border.all(
              width: 1.02,
              color: context.colorScheme.secondary,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              right: context.spacing.xl,
              top: context.spacing.sm,
              bottom: context.spacing.sm,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                        Assets.images.icon.discountShape,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    Text(
                      context.l10n.select,
                      style: HBTextStyles.bodyRegularLarge(
                        context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
    
                SvgPicture.asset(
                  Assets.images.icon.frameArrow,
                  colorFilter: ColorFilter.mode(
                    context.colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
