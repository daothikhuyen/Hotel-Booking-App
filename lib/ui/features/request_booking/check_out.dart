import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/data/repositories/api_status.dart';
import 'package:hotel_booking_app/routing/page_routes.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/ui/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/recommended_card.dart';
import 'package:hotel_booking_app/ui/features/my_booking/view_model/my_booking_controller.dart';
import 'package:hotel_booking_app/ui/features/request_booking/view_model/booking_controller.dart';
import 'package:hotel_booking_app/ui/features/request_booking/widgets/checkout/info_hotel_booking.dart';
import 'package:hotel_booking_app/ui/features/request_booking/widgets/checkout/promo_card.dart';
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
              RecommendedCard(
                name: hotel.name,
                location: hotel.location,
                currentPrice: hotel.currentPrice ?? 0,
                linkImage: hotel.image,
                rating: hotel.rating.toString(),
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
                  context: context,
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
