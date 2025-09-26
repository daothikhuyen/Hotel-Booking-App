import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/model/category.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/ui/core/widgets/category/category_item.dart';
import 'package:hotel_booking_app/ui/features/home/view_model/hotel_controller.dart';
import 'package:hotel_booking_app/utils/translation_helper.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({
    required this.listCategory,
    super.key,
  });

  final List<Category> listCategory;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.listCategory.isEmpty) {
      setState(() {
        selectedIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<HotelController>();

    return SizedBox(
      height: 43,
      child:
          widget.listCategory.isNotEmpty
              ? ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.listCategory.length,
                itemBuilder: (context, index) {
                  final category = widget.listCategory[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        controller.fetchHotelByCategory(context, category.uid);
                      });
                    },
                    child: CategoryItem(
                      key: ValueKey(category.uid),
                      title: getTranslatedText(context, category.title),
                      linkImage: category.image,
                      isSelected: selectedIndex == index,
                    ),
                  );
                },
              )
              : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: const Skeleton(width: 97, height: 43),
                  );
                },
              ),
    );
  }
}
