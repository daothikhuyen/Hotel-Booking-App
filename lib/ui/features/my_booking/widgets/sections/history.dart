import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/routing/page_routes.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/page_alter_null.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/vertical_skeleton_card.dart';
import 'package:hotel_booking_app/ui/features/auth/view_model/auth_controller.dart';
import 'package:hotel_booking_app/ui/features/my_booking/view_model/my_booking_controller.dart';
import 'package:hotel_booking_app/ui/features/my_booking/widgets/booking_card.dart';
import 'package:hotel_booking_app/ui/features/my_booking/widgets/booking_skeleton.dart';
import 'package:hotel_booking_app/utils/format.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  const History({required this.listHistoryBokked, super.key});
  final List<Booking> listHistoryBokked;

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();
  late MyBookingController controller;
  bool isLoading = true;
  bool _initialized = false;

  @override
  bool get wantKeepAlive => true;

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
            controller.hasMore) {
          controller.fetchMyBooking(
            context: context,
            table: 'history',
            loadMore: true,
          );
        }
      });
      _initialized = true;
    }

    // Khi logout
    if (authController.currentUser == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.reset(controller.listHistory);
        setState(() {
          isLoading = false;
          _initialized = false;
        });
      });
    }
  }

  Future<void> loadData() async {
    await controller.fetchMyBooking(context: context, table: 'history').then((
      value,
    ) {
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
                    margin: EdgeInsets.symmetric(vertical: context.spacing.sm),
                    child: BookingCard(
                      linkImage: hotel.image,
                      name: hotel.name,
                      location: hotel.location,
                      currentPrice: hotel.currentPrice ?? 0,
                      rating: hotel.rating.toString(),
                      dateTime: formatBookingDate(
                        myBooking.checkIn,
                        myBooking.checkOut,
                      ),
                      guest: myBooking.guests,
                    ),
                  ),
                );
              } else {
                return controller.hasMore && controller.isLoading
                    ? const VerticalSkeletonCard(height: 120)
                    : const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
