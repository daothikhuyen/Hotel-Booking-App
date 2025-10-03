import 'package:hotel_booking_app/ui/core/core.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: context.spacing.lg),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.spacing.sm,
          horizontal: context.spacing.lg,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 1.5.h,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.spacing.sm),
              child: Text(
                text,
                style: HBTextStyles.bodySemiboldSmall(
                  context.colorScheme.outline,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 1.5.h,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
