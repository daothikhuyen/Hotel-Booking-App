import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/request/counter_card.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/request/date_picker.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/request/pay_with.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/request/payment_detail.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({required this.hotel, super.key});

  final Hotel hotel;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String? formatStartDate;
  String? formatEndDate;
  int? nightCount;
  int? numberGuest;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: HBAppBar(
        isScrolled: false,
        title: context.l10n.titleRequestBooking,
        color: context.colorScheme.onSurfaceVariant,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // selected date
                DatePicker(
                  onDateSelected: (start, end, nights) {
                    setState(() {
                      formatStartDate = start;
                      formatEndDate = end;
                      nightCount = nights;
                    });
                  },
                ),

                // increase decrease in number
                CounterCard(guestNumber: (number) {
                  setState(() {
                    numberGuest = number;
                  });
                },),

                // Pay with
                const PayWith(nameBank: 'FastPayz', accountNumber: '*****6587'),

                // Payment Detail
                PaymentDetail(
                  hotel: widget.hotel,
                  nightsCount: nightCount ?? 0,
                  guestCount: numberGuest ?? 0,
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: PrimaryBtn(
          size: 56,
          textButton: context.l10n.titleCheckOut,
          onPressed: () {
  
            context.go(PageRoutes.checkout, extra: widget.hotel);
          },
          bold: true,
        ),
      ),
    );
  }
}
