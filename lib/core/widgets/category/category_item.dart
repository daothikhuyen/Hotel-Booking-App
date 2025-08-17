import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/utils/translation_helper.dart';

class CategoryItem  extends StatelessWidget {
  final String title;
  final String? linkImage;
  final bool isSelected;

  const CategoryItem ({
    super.key, required this.title, required this.linkImage, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12.0),
      decoration: BoxDecoration(
        color: isSelected ? context.colorScheme.primary : context.colorScheme.onPrimary,
        border: !isSelected ? Border.all(width: 1, color: context.colorScheme.outline.withValues(alpha: 0.3)): null,
        borderRadius: BorderRadius.circular(8.0), 
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon or image
          linkImage != '' ?
          Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.only(right: 3.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: !isSelected ? context.colorScheme.tertiary.withValues(alpha: 0.15) : context.colorScheme.onPrimary,
              shape: BoxShape.circle,
            ),
            child: Image.asset(linkImage!, fit: BoxFit.contain),
          ): const SizedBox.shrink(),
          Text(
            getTranslatedText(context, title),
            style: CustomTextStyles.bodyRegularSmall(!isSelected ? context.colorScheme.inverseSurface : context.colorScheme.onPrimary),
          ),
        ],
      ),
    );
  }
}
