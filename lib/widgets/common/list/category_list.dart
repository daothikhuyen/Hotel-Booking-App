import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/category_data.dart';
import 'package:hotel_booking_app/widgets/common/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return SizedBox(
      height: 43,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: category_data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
            },
            child: CategoryItem(
              title: category_data[index]['title']!,
              linkImage: category_data[index]['image'],
              isSelected: selectedIndex == index,
            ),
          );
        },
      ),
    );
  }
}
