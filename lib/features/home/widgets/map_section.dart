import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderCard(
          title: context.l10n.nearYou,
          titleBtn: context.l10n.openMap,
          onPressed: () {
            // TODOs: Handle action open map latter
          },
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10, right: 18),
          height: 167,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(Assets.images.home.map.path),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
