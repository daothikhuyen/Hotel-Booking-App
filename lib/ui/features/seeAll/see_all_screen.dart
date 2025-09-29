import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/routing/page_routes.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/ui/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/ui/features/home/view_model/hotel_controller.dart';
import 'package:hotel_booking_app/ui/features/seeAll/see_all_tab.dart';
import 'package:provider/provider.dart';

class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({required this.index, Key? key})
    : super(key: key ?? const ValueKey<String>('SeeAllScreen'));
  final int index;

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController.index = widget.index;
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HotelController>(context);

    return Scaffold(
      appBar: HBAppBar(
        isScrolled: false,
        title: context.l10n.hotel,
        color: context.colorScheme.onSurfaceVariant,
        onPressed: () => context.go(PageRoutes.homePage),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30, bottom: 18),
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      height: 55,
                      decoration: BoxDecoration(
                        color: context.colorScheme.outline.withValues(
                          alpha: 0.25,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TabBar(
                        splashFactory: NoSplash.splashFactory,
                        overlayColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ),
                        indicator: BoxDecoration(
                          color: context.colorScheme.surface,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        labelStyle: HBTextStyles.bodyMediumMedium(
                          context.colorScheme.tertiary,
                        ),
                        unselectedLabelColor: context.colorScheme.onTertiary,
                        dividerColor: Colors.transparent,
                        indicatorSize: TabBarIndicatorSize.tab,
                        controller: tabController,
                        tabs: [
                          Tab(text: context.l10n.all),
                          Tab(text: context.l10n.mostPopular),
                          Tab(text: context.l10n.homeRecommended),
                          Tab(text: context.l10n.bestToday),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TabBarView(
            controller: tabController,
            children: <Widget>[
              SeeAllTab(index: 0, controller:controller),
              SeeAllTab(index: 1, controller:controller),
              SeeAllTab(index: 2, controller:controller),
              SeeAllTab(index: 3, controller: controller,),
            ],
          ),
        ),
      ),
    );
  }
}
