import 'package:hotel_booking_app/ui/core/core.dart';
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
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
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
