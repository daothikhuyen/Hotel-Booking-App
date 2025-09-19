import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/utils/format.dart';
import 'package:hotel_booking_app/core/widgets/alter/page_alter_null.dart';
import 'package:hotel_booking_app/core/widgets/cards/vertical_skeleton_card.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/features/auth/controller/auth_controller.dart';
import 'package:hotel_booking_app/features/my_booking/controller/my_booking_controller.dart';
import 'package:hotel_booking_app/features/my_booking/widgets/booking_card.dart';
import 'package:hotel_booking_app/features/my_booking/widgets/booking_skeleton.dart';
import 'package:provider/provider.dart';

class Booked extends StatefulWidget {
  const Booked({required this.booked, super.key});
  final List<Booking> booked;

  @override
  State<Booked> createState() => _BookedState();
}

class _BookedState extends State<Booked> with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();
  bool isLoading = true;
  bool _initialized = false;
  late MyBookingController controller;

  @override
  bool get wantKeepAlive => true;

  Future<void> loadData() async {
    await controller.fetchMyBooking(table: 'booked').then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final authController = Provider.of<AuthController>(context);
    controller = Provider.of<MyBookingController>(context, listen: false);

    if (authController.currentUser != null && !_initialized) {
      loadData();
      _scrollController.addListener(() {
        if (_scrollController.position.pixels >=
                _scrollController.position.maxScrollExtent - 200 &&
            !controller.isLoading &&
            !controller.hasMore) {
          controller.fetchMyBooking(table: 'booked', loadMore: true);
        }
      });
      _initialized = true;
    }

    // Khi logout
    if (authController.currentUser == null) {
      controller.reset(controller.listBooking);
      setState(() {
        isLoading = false;
        _initialized = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final controller = Provider.of<MyBookingController>(context);

    return RefreshIndicator(
      onRefresh: () async {
        controller.reset(controller.listBooking);
        isLoading = true;
        await loadData();
      },
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          if (isLoading) return const BookingSkeleton();
          if (controller.listBooking.isEmpty) return const PageAlterNull();
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            itemCount: controller.listBooking.length + 1,
            itemBuilder: (context, index) {
              if (index < controller.listBooking.length) {
                final hotel = controller.listBooking[index].hotel;
                final myBooking = controller.listBooking[index];
                return GestureDetector(
                  onTap: () {
                    context.push(PageRoutes.bookingDetail, extra: myBooking);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: BookingCard(
                      linkImage: hotel.image,
                      name: hotel.name,
                      location: hotel.location,
                      currentPrice: hotel.currentPrice ?? 0,
                      ratting: hotel.ratting.toString(),
                      dateTime: formatBookingDate(
                        myBooking.checkIn,
                        myBooking.checkOut,
                      ),
                      guest: myBooking.guests,
                    ),
                  ),
                );
              } else {
                return !controller.hasMore  && controller.isLoading
                    ? const VerticalSkeletonCard(height: 262,)
                    : const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
