import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/page_alter_null.dart';
import 'package:hotel_booking_app/ui/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/ui/core/widgets/textfield.dart';
import 'package:hotel_booking_app/ui/features/home/controller/hotel_controller.dart';
import 'package:hotel_booking_app/ui/features/home/controller/search_hotel_controller.dart';
import 'package:hotel_booking_app/ui/features/search/widgets/hotel_search_card.dart';
import 'package:hotel_booking_app/ui/features/search/widgets/section/filter_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({required this.listHotelRecommentd, super.key});

  final List<Hotel> listHotelRecommentd;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _scrollController = ScrollController();
  final search = TextEditingController();
  late HotelController controller;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    search.addListener(_onSearchChanged);
  }

  Future<void> _onSearchChanged() async {
    final searchController = context.read<SearchHotelController>();

    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () async {
      final text = search.text;
      await searchController.searchHotel(context, text: text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SearchHotelController>(context);

    return Scaffold(
      appBar: HBAppBar(
        isScrolled: false,
        title: context.l10n.titleSearch,
        color: context.colorScheme.onSurfaceVariant,
        onPressed: () => context.go(PageRoutes.homePage),
      ),
      body: Padding(
        padding: context.spacing.horizlg.w,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: context.spacing.md.h),
              padding: EdgeInsets.symmetric(horizontal: context.spacing.lg.w),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.3.w,
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
                    child: HBTextField(
                      controller: search,
                      hintText: context.l10n.search,
                      color: Colors.transparent,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await filterCard(context, controller);
                    },
                    child: SvgPicture.asset(
                      Assets.images.icon.filter,
                      colorFilter: ColorFilter.mode(
                        context.colorScheme.onTertiary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(context.spacing.xs.w),
                child: RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      controller.isFilter = false;
                      search.text = '';
                    });
                  },
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      final listSearch =
                          controller.isFilter
                              ? controller.listHotelSearch
                              : search.text.isNotEmpty
                              ? controller.listHotelSearch
                              : widget.listHotelRecommentd;
                      return listSearch.isNotEmpty
                          ? ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            controller: _scrollController,
                            itemCount: listSearch.length + 1,
                            itemBuilder: (context, index) {
                              if (index < listSearch.length) {
                                final hotel = listSearch[index];
                                return GestureDetector(
                                  onTap: () {
                                    context.push(
                                      PageRoutes.detailPage,
                                      extra: hotel,
                                    );
                                  },
                                  child: HotelSearchCard(hotel: hotel),
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          )
                          : const PageAlterNull();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
