import 'package:flutter/material.dart';
import 'package:hotel_booking_app/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/utils/translation_helper.dart';

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
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12.0),
      decoration: BoxDecoration(
        color: isSelected ? context.colorScheme.primary : Colors.white,
        border: !isSelected ? Border.all(width: 1, color: const Color(0xFFE9EBED)): null,
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
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: Image.asset(linkImage!, fit: BoxFit.contain),
          ): const SizedBox.shrink(),
          Text(
            getTranslatedText(context, title),
            style: context.textTheme.bodyMedium!.copyWith(
              color: !isSelected ? context.colorScheme.tertiary : context.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
