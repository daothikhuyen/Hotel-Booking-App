import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/utils/format.dart';
import 'package:hotel_booking_app/core/widgets/alter/page_alter_null.dart';
import 'package:hotel_booking_app/features/my_booking/controller/my_booking_controller.dart';
import 'package:hotel_booking_app/features/my_booking/widgets/booking_card.dart';
import 'package:hotel_booking_app/features/my_booking/widgets/booking_skeleton.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> with AutomaticKeepAliveClientMixin{
  final controller = MyBookingController();
  final _scrollController = ScrollController();
  bool isLoading = true;

    
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    loadData();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !controller.isLoading &&
          controller.hasMore) {
        controller.fetchMyBooking(table: 'history', loadMore: true);
      }
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
    return RefreshIndicator(
      onRefresh: () async {
        controller.reset();
        isLoading = true;
        await loadData();
      },
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          if (isLoading) return const BookingSkeleton();
          if (controller.listBooking.isEmpty) return const PageAlterNull();
          return ListView.builder(
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
                return controller.hasMore
                    ? const Center(child: CircularProgressIndicator())
                    : const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
