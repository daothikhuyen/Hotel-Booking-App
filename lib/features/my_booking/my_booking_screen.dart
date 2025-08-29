import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/core/widgets/textfield.dart';
import 'package:hotel_booking_app/features/my_booking/widgets/sections/booked.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({Key? key})
    : super(key: key ?? const ValueKey<String>('MyBookingScreen'));

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final search = TextEditingController();

    return Scaffold(
      appBar: HBAppBar(
        isScrolled: false,
        title: context.l10n.mybooking,
        color: context.colorScheme.onSurfaceVariant,
        onPressed: () => context.go(PageRoutes.homePage),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.3,
                          color: context.colorScheme.outline,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            Assets.images.icon.search,
                            colorFilter: ColorFilter.mode(
                              context.colorScheme.onTertiary,
                              BlendMode.srcIn,
                            ),
                          ),
                          Expanded(
                            child: HBTexField(
                              controller: search,
                              hintText: context.l10n.search,
                              color: Colors.transparent,
                            ),
                          ),
                          SvgPicture.asset(
                            Assets.images.icon.filter,
                            colorFilter: ColorFilter.mode(
                              context.colorScheme.onTertiary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                          Tab(text: context.l10n.booked),
                          Tab(text: context.l10n.history),
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
            children: const <Widget>[
              Booked(),
              Center(child: Text('Page History')),
            ],
          ),
        ),
      ),
    );
  }
}
