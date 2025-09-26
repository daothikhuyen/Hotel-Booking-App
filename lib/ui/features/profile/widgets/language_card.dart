import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';

class LanguageCard extends StatefulWidget {
  const LanguageCard({
    required this.isSelected,
    required this.title,
    required this.onPressed, required this.color, super.key,
  });
  final bool isSelected;
  final String title;
  final VoidCallback onPressed;
  final Color color;

  @override
  State<LanguageCard> createState() => _LanguageCardState();
}

class _LanguageCardState extends State<LanguageCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: widget.onPressed,
              child: Text(
                widget.title,
                style: HBTextStyles.bodySemiboldMedium(
                  widget.color,
                ),
              ),
            ),
          ),
      
          if (widget.isSelected)
            SvgPicture.asset(Assets.images.icon.tick, width: 16, height: 16)
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}
