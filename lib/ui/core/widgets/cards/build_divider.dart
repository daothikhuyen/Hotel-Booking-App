import 'package:hotel_booking_app/ui/core/core.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 1.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorScheme.outline.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}
