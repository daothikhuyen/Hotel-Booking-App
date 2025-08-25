import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/core/widgets/cards/recomended_card.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/checkout/info_hotel_booking.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/checkout/promo_card.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({required this.hotel, super.key});

  final Hotel hotel;

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HBAppBar(
        isScrolled: false,
        title: context.l10n.titleCheckOut,
        color: context.colorScheme.onSurfaceVariant,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 25),
        child: Column(
          children: [
            RecomendedItem(
              name: widget.hotel.name,
              location: widget.hotel.location,
              currentPrice: widget.hotel.currentPrice ?? 0,
              linkImage: widget.hotel.image,
              ratting: widget.hotel.ratting.toString(),
            ),

            const InfoHotelBooking(),
            // promo
            const SizedBox(height: 18,),
            const PromoCard(),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 25),
        child: PrimaryBtn(
          textButton: context.l10n.selectPayment,
          onPressed: () {},
          bold: true,
          size: 56,
        ),
      ),
    );
  }
}



