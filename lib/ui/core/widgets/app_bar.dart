import 'package:hotel_booking_app/ui/core/core.dart';

class HBAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HBAppBar({
    required this.title,
    required this.isScrolled,
    required this.color,
    required this.onPressed,
    super.key,
  });

  final bool isScrolled;
  final String title;
  final Color color;
  final VoidCallback onPressed;

  @override
  Size get preferredSize => Size.fromHeight(50.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          isScrolled
              ? BoxDecoration(
                color: context.colorScheme.surface,
                border: Border(
                  bottom: BorderSide(
                    width: 0.5.w,
                    color: context.colorScheme.outline,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.onTertiary,
                    offset: const Offset(0, -1),
                    blurRadius: 10.r,
                  ),
                ],
              )
              : const BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.only(
          top: context.spacing.xxl.h,
          bottom: context.spacing.lg.h,
          right: context.spacing.xl.w,
          left: context.spacing.xl.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: onPressed,
              child: Icon(
                Icons.arrow_back,
                color:
                    isScrolled ? context.colorScheme.onSurfaceVariant : color,
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: HBTextStyles.bodySemiboldLarge(
                  isScrolled ? context.colorScheme.onSurfaceVariant : color,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: () {
                context.go(PageRoutes.homePage);
              },
              child: Icon(
                Icons.home_outlined,
                size: 24.w,
                color:
                    isScrolled ? context.colorScheme.onSurfaceVariant : color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
