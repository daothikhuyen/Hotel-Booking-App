import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/detail/widgets/bottom_bar.dart';
import 'package:hotel_booking_app/core/widgets/custom_app_bar.dart';
import 'package:hotel_booking_app/features/detail/widgets/popup_card.dart';
import 'package:hotel_booking_app/features/home/controller/hotel_controller.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.hotel});

  final Hotel hotel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Hotel> hotelRecomended = [];
  bool isScrolled = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final controller = Provider.of<HotelController>(context, listen: false);
      final recomended = await controller.fetchRecomendedHotels();

      setState(() {
        hotelRecomended = recomended;
      });
    });
  }

  void onScrollChange(bool scrolled) {
    setState(() {
      isScrolled = scrolled;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HotelController>(context, listen: false);

    return Scaffold(
      body: Stack(
        // fit: StackFit.expand,
        children: [
          widget.hotel.image.isNotEmpty
              ? Container(
                height: 374,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.hotel.image),
                    fit: BoxFit.cover,
                  ),
                ),
              )
              : Skeleton(width: double.infinity, height: 374),

          Container(
            height: 374,
            decoration: BoxDecoration(
              color: context.colorScheme.inverseSurface.withValues(alpha: 0.35),
            ),
          ),

          // body detail
          PopupCard(
            widget: widget,
            hotelRecomended: hotelRecomended,
            onScrollChange: onScrollChange,
          ),

          // header detail
          CustomAppBar(isScrolled: isScrolled),

          // booking bottom bar
          ButtomBar(widget: widget),
        ],
      ),
    );
  }
}


