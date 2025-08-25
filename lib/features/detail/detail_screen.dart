import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/detail/widgets/bottom_bar.dart';
import 'package:hotel_booking_app/features/detail/widgets/popup_card.dart';
import 'package:hotel_booking_app/features/home/controller/hotel_controller.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({required this.hotel, super.key});

  final Hotel hotel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Hotel> hotelRecomended = [];
  bool isScrolled = false;
  late final HotelController controller;

  @override
  void initState() {
    super.initState();
    controller = Provider.of<HotelController>(context, listen: false);
  }

  Future<void> _loadBestTodayHotels() async {
    final bestToday = await controller.fetchRecomendedHotels(context);
    setState(() {
      hotelRecomended = bestToday;
    });
  }

  void onScrollChange({required bool scrolled}) {
    setState(() {
      isScrolled = scrolled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // fit: StackFit.expand,
        children: [
          if (widget.hotel.image.isNotEmpty)
            Container(
              height: 374,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.hotel.image),
                  fit: BoxFit.cover,
                ),
              ),
            )
          else
            const Skeleton(width: double.infinity, height: 374),

          Container(
            height: 374,
            decoration: BoxDecoration(
              color: context.colorScheme.inverseSurface.withValues(alpha: 0.35),
            ),
          ),

          // body detail
          VisibilityDetector(
            key: const Key('recommednedDetail-section'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.1 && hotelRecomended.isEmpty) {
                _loadBestTodayHotels();
              }
            },
            child: PopupCard(
              widget: widget,
              hotelRecomended: hotelRecomended,
              onScrollChange: onScrollChange,
            ),
          ),

          // header detail
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HBAppBar(
              isScrolled: isScrolled,
              title: context.l10n.titleDetail,
              color: context.colorScheme.onSecondary,
            ),
          ),

          // booking bottom bar
          ButtomBar(widget: widget),
        ],
      ),
    );
  }
}
