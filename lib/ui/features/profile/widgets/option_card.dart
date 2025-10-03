import 'package:hotel_booking_app/ui/core/core.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    required this.title,
    required this.image,
    required this.onPressed,
    super.key,
  });

  final String title;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            image,
            width: 20.w,
            height: 20.h,
            colorFilter: ColorFilter.mode(
              context.colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: context.spacing.lg),
          Expanded(
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.01.w,
                    color: context.colorScheme.outline.withValues(alpha: 0.5),
                  ),
                ),
              ),
              child: Text(
                title,
                style: HBTextStyles.bodySemiboldMedium(
                  context.colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
