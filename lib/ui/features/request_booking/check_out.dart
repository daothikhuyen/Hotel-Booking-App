import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/ui/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/recommended_card.dart';
import 'package:hotel_booking_app/ui/features/my_booking/controller/my_booking_controller.dart';
import 'package:hotel_booking_app/ui/features/request_booking/controller/booking_controller.dart';
import 'package:hotel_booking_app/ui/features/request_booking/widgets/checkout/info_hotel_booking.dart';
import 'package:hotel_booking_app/ui/features/request_booking/widgets/checkout/promo_card.dart';

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
        padding: EdgeInsets.only(
          left: context.spacing.lg,
          right: context.spacing.lg,
          top: context.spacing.lg,
        ),
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
              SizedBox(height: context.spacing.lg),
              const PromoCard(),
              SizedBox(height: context.spacing.sm),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: context.spacing.lg,
          right: context.spacing.lg,
          bottom: context.spacing.xl,
        ),
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
              } else {
                HBSnackBar().showSnackBar(context, value.message);
              }
            });
          },
          bold: true,
          size: 46.h,
          isSelected: true,
        ),
      ),
    );
  }
}
