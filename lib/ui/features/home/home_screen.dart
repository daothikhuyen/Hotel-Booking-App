import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/ui/core/widgets/category/category_list.dart';
import 'package:hotel_booking_app/ui/core/widgets/list/list_horizontal.dart';
import 'package:hotel_booking_app/ui/core/widgets/list/list_vertical.dart';
import 'package:hotel_booking_app/ui/features/auth/view_model/auth_controller.dart';
import 'package:hotel_booking_app/ui/features/home/view_model/hotel_controller.dart';
import 'package:hotel_booking_app/ui/features/home/view_model/navigation_controller.dart';
import 'package:hotel_booking_app/ui/features/home/widgets/header_bar.dart';
import 'package:hotel_booking_app/ui/features/home/widgets/list_popular.dart';
import 'package:hotel_booking_app/ui/features/home/widgets/map_section.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controllerCategory = Provider.of<NavigationController>(context);
    final controller = Provider.of<HotelController>(context);
    final userProvider = Provider.of<AuthController>(context);
    final user = userProvider.currentUser;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.reset(4);
          controllerCategory.reset();
          await controller.fetchMostPopularHotels(context, limit: 4);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: context.height.expandedAppBar.h,
              toolbarHeight:  context.height.toolbar.h,
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
                    padding: EdgeInsets.only(
                      left: context.spacing.lg.w,
                      top: context.spacing.lg.h,
                    ),
                    child: SizedBox(
                      height: 57.h,
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
                padding: EdgeInsets.only(
                  left: context.spacing.lg,
                  top: context.spacing.sm,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: context.spacing.lg,
                        bottom: context.spacing.md,
                      ),
                      width: double.infinity,
                      height: 62.h,
                      decoration: BoxDecoration(
                        color: context.colorScheme.secondary,
                        border: Border.all(
                          width: 1.02.w,
                          color: context.colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: context.spacing.md,
                          top: context.spacing.lg,
                          bottom: context.spacing.lg,
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
                    VisibilityDetector(
                      key: const Key('popular-section'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction >= 0.1 &&
                            controller.listPopular.isEmpty) {
                          controller.fetchMostPopularHotels(context, limit: 4);
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
                    ),

                    // Recommended For You
                    VisibilityDetector(
                      key: const Key('recommended-section'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.1 &&
                            controller.listRecomended.isEmpty) {
                          controller.fetchRecomendedHotels(context, limit: 3);
                          controllerCategory.fetchCategory(context);
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
                          SizedBox(height: context.spacing.xs.h),
                          // category list
                          CategoryList(
                            key: ValueKey(controllerCategory.listCategory),
                            listCategory: controllerCategory.listCategory,
                          ),
                          SizedBox(height: context.spacing.sm.h),
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
                      padding: EdgeInsets.only(right: 18.w),
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
