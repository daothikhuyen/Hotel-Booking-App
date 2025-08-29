import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/widgets/alter/diaglog.dart';
import 'package:hotel_booking_app/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/auth/controller/auth_controller.dart';
import 'package:hotel_booking_app/features/request_booking/helpers/booking_helper.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/request/counter_card.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/request/date_picker.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/request/pay_with.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/request/payment_detail.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({required this.hotel, super.key});

  final Hotel hotel;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late DateTime formatStartDate;
  late DateTime formatEndDate;
  double cleaningFee = 5;
  int? nightCount;
  int? numberGuest;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthController>(context);

    return Scaffold(
      appBar: HBAppBar(
        isScrolled: false,
        title: context.l10n.titleRequestBooking,
        color: context.colorScheme.onSurfaceVariant,
        onPressed: () => context.pop(),
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
                CounterCard(
                  guestNumber: (number) {
                    setState(() {
                      numberGuest = number;
                    });
                  },
                ),

                // Pay with
                const PayWith(nameBank: 'FastPayz', accountNumber: '*****6587'),

                // Payment Detail
                PaymentDetail(
                  cleaningFree: cleaningFee,
                  serviceFee: calculatorServiceFee(numberGuest ?? 0),
                  nightsCount: nightCount ?? 0,
                  nightlyRate: calculatorNightlyRate(
                    widget.hotel.currentPrice ?? 0,
                    nightCount ?? 0,
                  ),
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
            if (nightCount == null || numberGuest == null) {
              HBDiaglog().diaglogBuilder(
                context: context,
                title: context.l10n.notification,
                desc: context.l10n.notifiBookingFailure,
                isAction: false,
                isClose: true,
                action: () {},
              );
            } else {
              final booking = buildBooking(
                widget.hotel,
                formatStartDate,
                formatEndDate,
                numberGuest,
                userProvider,
                nightCount,
              );
              context.push(PageRoutes.checkout, extra: booking);
            }
          },
          bold: true,
        ),
      ),
    );
  }
}
