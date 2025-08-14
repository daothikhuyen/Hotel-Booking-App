import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/widgets/home/sections/header_section.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          HeaderSection(
            title: AppLocalizations.of(context)!.nearYou,
            titleBtn: AppLocalizations.of(context)!.openMap,
            onPressed: () {},
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, right: 18),
            height: 167,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage('assets/images/home/Map.png'),
                  fit: BoxFit.cover,
                ),
            ),
           
          )
        ],
      );
  }
}
