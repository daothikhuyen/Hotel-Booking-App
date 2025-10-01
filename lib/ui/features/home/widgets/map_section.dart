import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/header_card.dart';

class MapSection extends StatelessWidget {
  const MapSection({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderCard(
          title: title,
          titleBtn: context.l10n.openMap,
          onPressed: () {
            // TODOs: Handle action open map latter
          },
        ),
        Container(
          margin: EdgeInsets.only(
            top: context.spacing.sm,
            bottom: context.spacing.sm,
          ),
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
