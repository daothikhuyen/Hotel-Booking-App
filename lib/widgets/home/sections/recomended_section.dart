import 'package:flutter/material.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/widgets/home/sections/header_section.dart';
import 'package:hotel_booking_app/widgets/common/list/category_list.dart';

class RecomendedSection extends StatelessWidget {
  const RecomendedSection({super.key});

  get selectedIndex => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          HeaderSection(
            title: AppLocalizations.of(context)!.homeRecommended,
            titleBtn: AppLocalizations.of(context)!.seeAll,
            onPressed: () {},
          ),
          SizedBox(height: 5),
          // category list
          CategoryList(),
          
        ],
      ),
    );
  }
}
