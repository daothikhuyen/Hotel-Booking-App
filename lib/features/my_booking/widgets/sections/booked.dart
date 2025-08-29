import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/utils/format.dart';
import 'package:hotel_booking_app/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/features/my_booking/controller/my_booking_controller.dart';
import 'package:hotel_booking_app/features/my_booking/widgets/booking_card.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class Booked extends StatefulWidget {
  const Booked({super.key});

  @override
  State<Booked> createState() => _BookedState();
}

class _BookedState extends State<Booked> {
  final controller = MyBookingController();
  bool isLoading = false;
  List<Booking> listBooking = [];

  late final _pagingController = PagingController<int, Booking>(
    getNextPageKey:
        (state) => state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) async {
      final mybooking = await MyBookingController().fetchMyBooking();

      return mybooking;
    },
  );

  @override
  void initState() {
    super.initState();
    _loadMoreData();
  }

  Future<void> _loadMoreData() async {
    final mybooking = await controller.fetchMyBooking();
    if (isLoading) return;
    setState(() {
      listBooking = mybooking;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return listBooking.isNotEmpty
        ? PagingListener(
          controller: _pagingController,
          builder:
              (context, state, fetchNextPage) => PagedListView<int, Booking>(
                state: state,
                fetchNextPage: fetchNextPage,
                builderDelegate: PagedChildBuilderDelegate(
                  itemBuilder: (context, item, index) {
                    final myBooking = item;
                    final hotel = myBooking.hotel;
                    return Container(
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
                    );
                  },
                  firstPageErrorIndicatorBuilder:
                      (context) => const SizedBox.shrink(),
                  noMoreItemsIndicatorBuilder:
                      (context) => const SizedBox.shrink(),
                ),
              ),
        )
        : ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Shimmer(
              interval: const Duration(seconds: 5),
              colorOpacity: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 176,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.3,
                    color: context.colorScheme.outline.withValues(alpha: 0.5),
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Row(
                  children: [
                    Skeleton(width: 96, height: 152),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Skeleton(width: 200, height: 30),
                          SizedBox(height: 8),
                          Skeleton(width: 200, height: 30),
                          SizedBox(height: 8),
                          Skeleton(width: 200, height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
  }
}
