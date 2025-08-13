import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/category_data.dart';
import 'package:hotel_booking_app/widgets/common/category_item.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
              setState(() {
                selectedIndex = index;
              });
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
