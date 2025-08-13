import 'package:flutter/material.dart';
import 'package:hotel_booking_app/themes/theme.dart';
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
      margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12.0),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).colorScheme.primary : Colors.white,
        border: !isSelected ? Border.all(width: 1, color: Color(0xFFE9EBED)): null,
        borderRadius: BorderRadius.circular(8.0), 
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon hoặc ảnh
          linkImage != '' ?
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(right: 3.0),
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: Image.asset(linkImage!, fit: BoxFit.contain),
          ): SizedBox.shrink(),
          Text(
            getTranslatedText(context, title),
            style: CustomerTextStyles.suitableTextStyle(isSelected ? Colors.white : Colors.grey[700])
          ),
        ],
      ),
    );
  }
}
