import 'package:hotel_booking_app/ui/core/core.dart';

class SecondBtn extends StatelessWidget {
  const SecondBtn({
    required this.titleBtn,
    required this.color,
    required this.onPressed,
    this.radiusSize = 30,
    this.size = 0,
    super.key,
  });

  final String titleBtn;
  final Color color;
  final double radiusSize;
  final double size;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(overlayColor: Colors.transparent),
      child: Container(
        height: size == 0 ? null : size,
        width: size == 0 ? null : double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing.md,
          vertical: context.spacing.sm,
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 1.5.w, color: color),
          borderRadius: BorderRadius.circular(radiusSize),
        ),
        child: Center(
          child: Text(titleBtn, style: HBTextStyles.bodySemiboldMedium(color)),
        ),
      ),
    );
  }
}
