import 'package:hotel_booking_app/data/model/booking.dart';
import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/ui/core/widgets/textfield.dart';
import 'package:hotel_booking_app/ui/features/my_booking/controller/my_booking_controller.dart';
import 'package:hotel_booking_app/ui/features/my_booking/widgets/sections/booked.dart';
import 'package:hotel_booking_app/ui/features/my_booking/widgets/sections/history.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({Key? key})
    : super(key: key ?? const ValueKey<String>('MyBookingScreen'));

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;
  final search = TextEditingController();
  Timer? _debounce;
  List<Booking> booked = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    search.addListener(_onSearchChanged);
  }

  Future<void> _onSearchChanged() async {
    final searchController = context.read<MyBookingController>();

    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () async {
      final text = search.text;
      booked = await searchController.searchBooked(
        context: context,
        text: text,
        isHistory: tabController.index == 1,
      );
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    search
      ..removeListener(_onSearchChanged)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                padding: context.spacing.allLg,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.spacing.md.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.3.w,
                          color: context.colorScheme.outline,
                        ),
                        borderRadius: BorderRadius.circular(30.r),
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
                            child: HBTextField(
                              controller: search,
                              hintText: context.l10n.search,
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (search.text.isEmpty)
                      Container(
                        margin: EdgeInsets.only(
                          top: context.spacing.xl.h,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: context.spacing.xs.h,
                          horizontal: context.spacing.xs.w,
                        ),
                        height: 48.h,
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
                      )
                    else
                      const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: context.spacing.horizMd,
          child: TabBarView(
            controller: tabController,
            children: <Widget>[
              Booked(booked: booked),
              History(listHistoryBokked: booked),
            ],
          ),
        ),
      ),
    );
  }
}
