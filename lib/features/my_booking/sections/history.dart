import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/utils/format.dart';
import 'package:hotel_booking_app/core/widgets/alter/page_alter_null.dart';
import 'package:hotel_booking_app/core/widgets/cards/vertical_skeleton_card.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/features/my_booking/controller/my_booking_controller.dart';
import 'package:hotel_booking_app/features/my_booking/widgets/booking_card.dart';
import 'package:hotel_booking_app/features/my_booking/widgets/booking_skeleton.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  const History({required this.listHistoryBokked, super.key});
  final List<Booking> listHistoryBokked;

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> with AutomaticKeepAliveClientMixin{
  final _scrollController = ScrollController();
  late MyBookingController controller;
  bool isLoading = true;

    
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller =  Provider.of<MyBookingController>(context, listen: false);
      loadData();
      _scrollController.addListener(() {
        if (_scrollController.position.pixels >=
                _scrollController.position.maxScrollExtent - 200 &&
            !controller.isLoading &&
            !controller.hasMore) {
          controller.fetchMyBooking(table: 'history', loadMore: true);
        }
      });
    });
  }

  Future<void> loadData() async {
    await controller.fetchMyBooking(table: 'history').then((value) {
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
  Widget build(BuildContext context) {
    super.build(context);
    final controller = Provider.of<MyBookingController>(context); 

    return RefreshIndicator(
      onRefresh: () async {
        controller.reset(controller.listHistory);
        isLoading = true;
        await loadData();
      },
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          if (isLoading) return const BookingSkeleton();
          if (controller.listHistory.isEmpty) return const PageAlterNull();
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            itemCount: controller.listHistory.length + 1,
            itemBuilder: (context, index) {
              if (index < controller.listHistory.length) {
                final hotel = controller.listHistory[index].hotel;
                final myBooking = controller.listHistory[index];
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
                return !controller.hasMore && controller.isLoading
                    ? const VerticalSkeletonCard(height: 262)
                    : const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
