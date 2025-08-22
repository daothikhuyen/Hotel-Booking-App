import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/widgets/category/category_item.dart';
import 'package:hotel_booking_app/data/data/category_data.dart';

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
        physics: const BouncingScrollPhysics(),
        itemCount: categoryData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: CategoryItem(
              title: categoryData[index]['title'] ?? 'All',
              linkImage: categoryData[index]['image'],
              isSelected: selectedIndex == index,
            ),
          );
        },
      ),
    );
  }
}
