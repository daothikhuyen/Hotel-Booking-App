import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/routing/page_routes.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/page_alter_null.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/build_divider.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/recommended_card.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/vertical_skeleton_card.dart';
import 'package:hotel_booking_app/ui/features/home/view_model/hotel_controller.dart';

class SeeAllTab extends StatefulWidget {
  const SeeAllTab({required this.index, required this.controller, super.key});
  final int index;
  final HotelController controller;

  @override
  State<SeeAllTab> createState() => _SeeAllTabState();
}

class _SeeAllTabState extends State<SeeAllTab>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();
  bool isLoading = true;
  late HotelController controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

      controller = widget.controller;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData(loadMore: false).then((value) {
        setState(() {
          isLoading = false;
        });
      });
      _scrollController.addListener(() {
        if (_scrollController.position.pixels >=
                _scrollController.position.maxScrollExtent - 200 &&
            !controller.isLoading &&
            controller.hasMore) {
          loadData(loadMore: true);
        }
      });
    });
  }

  Future<void> loadData({required bool loadMore}) async {
    switch (widget.index) {
      case 0:
        await controller.fetchAll(context, loadMore: loadMore);
      case 1:
        await controller.fetchMostPopularHotels(context, loadMore: loadMore);
      case 2:
        await controller.fetchRecomendedHotels(context, loadMore: loadMore);
      case 3:
        await controller.fetchBestToday(context, loadMore: loadMore);
      default:
        await controller.fetchMostPopularHotels(context, loadMore: loadMore);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<Hotel> hotels;

    switch (widget.index) {
      case 0:
        hotels = controller.listAll;
      case 1:
        hotels = controller.listPopular;
      case 2:
        hotels = controller.listRecomended;
      case 3:
        hotels = controller.listBestToday;
      default:
        hotels = controller.listPopular;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: RefreshIndicator(
        onRefresh: () async {
          controller.reset(widget.index);
          isLoading = true;
          await loadData(loadMore: false).then((value) {
            setState(() {
              isLoading = false;
            });
          });
        },
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            if (isLoading) return const VerticalSkeletonCard();
            if (hotels.isEmpty) return const PageAlterNull();
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                if (index < hotels.length) {
                  final hotel = hotels[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push(PageRoutes.detailPage, extra: hotel);
                        },
                        child: RecommendedCard(
                          linkImage: hotel.image,
                          name: hotel.name,
                          location: hotel.location,
                          currentPrice: hotel.currentPrice ?? 0,
                          rating: hotel.rating.toString(),
                        ),
                      ),
                      if (index < hotels.length - 1)
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 14,
                          ),
                          child: BuildDivider(),
                        )
                      else
                        const SizedBox.shrink(),
                    ],
                  );
                } else {
                  return controller.hasMore && controller.isLoading
                      ? const VerticalSkeletonCard()
                      : const SizedBox.shrink();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
