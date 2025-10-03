import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/dialog.dart';
import 'package:hotel_booking_app/ui/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/ui/features/auth/view_model/auth_controller.dart';
import 'package:hotel_booking_app/ui/features/request_booking/widgets/request/counter_card.dart';
import 'package:hotel_booking_app/ui/features/request_booking/widgets/request/date_picker.dart';
import 'package:hotel_booking_app/ui/features/request_booking/widgets/request/pay_with.dart';
import 'package:hotel_booking_app/ui/features/request_booking/widgets/request/payment_detail.dart';
import 'package:hotel_booking_app/utils/helpers/booking_helper.dart';

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
            padding: EdgeInsets.symmetric(horizontal: context.spacing.lg.h),
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
        padding: context.spacing.allLg.h,
        child: PrimaryBtn(
          size: 46.h,
          textButton: context.l10n.titleCheckOut,
          onPressed: () {
            if (nightCount == null || numberGuest == null) {
              HBDialog().showAlertDialog(
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
          isSelected: true,
        ),
      ),
    );
  }
}
