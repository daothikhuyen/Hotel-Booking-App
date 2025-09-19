import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/core/widgets/category/category_list.dart';
import 'package:hotel_booking_app/core/widgets/list/list_horizontal.dart';
import 'package:hotel_booking_app/core/widgets/list/list_vertical.dart';
import 'package:hotel_booking_app/features/auth/controller/auth_controller.dart';
import 'package:hotel_booking_app/features/home/controller/hotel_controller.dart';
import 'package:hotel_booking_app/features/home/widgets/header_bar.dart';
import 'package:hotel_booking_app/features/home/widgets/list_popular.dart';
import 'package:hotel_booking_app/features/home/widgets/map_section.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HotelController>(context);
    final userProvider = Provider.of<AuthController>(context);
    final user = userProvider.currentUser;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.reset(4);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 75,
              toolbarHeight: 75,
              elevation: 0,
              shadowColor: context.colorScheme.onSurfaceVariant.withValues(
                alpha: 0.4,
              ),
              pinned: true,
              automaticallyImplyLeading: false,
              surfaceTintColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, top: 30),
                    child: SizedBox(
                      height: 60,
                      child: HeaderBar(
                        linkImage: user?.photoURL ?? '',
                        userName: user?.displayName ?? '',
                        location: user?.location ?? '', // location now
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 18, top: 8),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      width: double.infinity,
                      height: 72,
                      decoration: BoxDecoration(
                        color: context.colorScheme.secondary,
                        border: Border.all(
                          width: 1.02,
                          color: context.colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          // left: 5,
                          right: 20,
                          top: 16,
                          bottom: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundColor:
                                      context.colorScheme.onSecondary,
                                  child: SvgPicture.asset(
                                    Assets.images.icon.frame,
                                  ),
                                ),
                                Text(
                                  context.l10n.locationTitle,
                                  style: HBTextStyles.bodyRegularSmall(
                                    context.colorScheme.inverseSurface,
                                  ),
                                ),
                              ],
                            ),

                            SvgPicture.asset(Assets.images.icon.frameArrow),
                          ],
                        ),
                      ),
                    ),
                    // Most Popular
                    LayoutBuilder(
                      builder: (context, constraints) {
                        
                        return VisibilityDetector(
                          key: UniqueKey(),
                          onVisibilityChanged: (info) {
                            if (info.visibleFraction >= 0.1 &&
                                controller.listPopular.isEmpty) {
                              controller.fetchMostPopularHotels(
                                context,
                                limit: 4,
                              );
                            }
                          },
                          child: Column(
                            children: [
                              ListPopular(
                                controller.listPopular,
                                controller.listPopular.length < 10
                                        ? controller.listPopular.length
                                        : 10,
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    // Recommendex For You
                    VisibilityDetector(
                      key: const Key('recommended-section'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.1 &&
                            controller.listRecomended.isEmpty) {
                          controller.fetchRecomendedHotels(context, limit: 3);
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeaderCard(
                            title: context.l10n.homeRecommended,
                            titleBtn: context.l10n.seeAll,
                            onPressed: () {
                              context.push(PageRoutes.seeAllPage, extra: 2);
                            },
                          ),
                          const SizedBox(height: 5),
                          // category list
                          const CategoryList(),
                          const SizedBox(height: 10),
                          ListVertical(
                            controller.listRecomended,
                            context.l10n.homeRecommended,
                            context.l10n.seeAll,
                            controller.listRecomended.length < 3
                                ? controller.listRecomended.length
                                : 3,
                          ),
                        ],
                      ),
                    ),
                    // Map
                    Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: MapSection(title: context.l10n.nearYou),
                    ),
                    // Best Today
                    VisibilityDetector(
                      key: const Key('bestToday-section'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.1 &&
                            controller.listBestToday.isEmpty) {
                          controller.fetchBestToday(context, limit: 4);
                        }
                      },
                      child: ListHorizontal(
                        controller.listBestToday,
                        context.l10n.bestToday,
                        context.l10n.seeAll,
                        controller.listBestToday.length < 10
                                ? controller.listBestToday.length
                                : 10,
                        3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
