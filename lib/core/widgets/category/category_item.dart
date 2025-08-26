import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/utils/translation_helper.dart';

class CategoryItem extends StatelessWidget {

  const CategoryItem({
    required this.title,
    required this.linkImage,
    required this.isSelected,
    super.key,
  });

  final String title;
  final String? linkImage;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color:
            isSelected
                ? context.colorScheme.primary
                : context.colorScheme.onPrimary,
        border:
            !isSelected
                ? Border.all(
                  width: 1.01,
                  color: context.colorScheme.outline.withValues(alpha: 0.5),
                )
                : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon or image
          if (linkImage != '') Container(
                width: 30,
                height: 30,
                margin: const EdgeInsets.only(right: 3),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color:
                      !isSelected
                          ? context.colorScheme.tertiary.withValues(alpha: 0.15)
                          : context.colorScheme.onPrimary,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(linkImage!, fit: BoxFit.contain),
              ) else const SizedBox.shrink(),
          Text(
            getTranslatedText(context, title),
            style: HBTextStyles.bodyRegularSmall(
              !isSelected
                  ? context.colorScheme.tertiary
                  : context.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
