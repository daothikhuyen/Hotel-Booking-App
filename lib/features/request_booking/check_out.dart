import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/response/api_status.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/core/widgets/cards/recomended_card.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/features/my_booking/controller/my_booking_controller.dart';
import 'package:hotel_booking_app/features/request_booking/controller/booking_controller.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/checkout/info_hotel_booking.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/checkout/promo_card.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({required this.booking, super.key});

  final Booking booking;

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    final myBookingController = Provider.of<MyBookingController>(context);
    final controller = Provider.of<BookingController>(context);
    final hotel = widget.booking.hotel;

    return Scaffold(
      appBar: HBAppBar(
        isScrolled: false,
        title: context.l10n.titleCheckOut,
        color: context.colorScheme.onSurfaceVariant,
        onPressed: () => context.pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RecomendedCard(
                name: hotel.name,
                location: hotel.location,
                currentPrice: hotel.currentPrice ?? 0,
                linkImage: hotel.image,
                ratting: hotel.ratting.toString(),
              ),

              InfoHotelBooking(booking: widget.booking),
              // promo
              const SizedBox(height: 18),
              const PromoCard(),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 25),
        child: PrimaryBtn(
          textButton: context.l10n.selectPayment,
          onPressed: () {
            controller.createBooking(context, widget.booking).then((value) {
              if (value.status == ApiStatus.success) {
                myBookingController.fetchMyBooking(
                  table: 'booked',
                  loadMore: true,
                );
                context.push(PageRoutes.bookingSucess);
              }else{
                HBSnackBar().showSnackBar(context, value.message);
              }
            });
          },
          bold: true,
          size: 56,
          isSelected: true,
        ),
      ),
    );
  }
}
