import 'package:hotel_booking_app/ui/core/core.dart';

class SocialItem extends StatelessWidget {
  const SocialItem({
    required this.linkIcon,
    required this.onPressed,
    super.key,
  });

  final String linkIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 72.w,
        height: 48.h,
        padding: EdgeInsets.all(context.spacing.md),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: context.colorScheme.outline.withValues(alpha: 0.5),
        ),
        child: SvgPicture.asset(linkIcon),
      ),
    );
  }
}
