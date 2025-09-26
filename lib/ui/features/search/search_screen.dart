import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/routing/page_routes.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/page_alter_null.dart';
import 'package:hotel_booking_app/ui/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/ui/core/widgets/textfield.dart';
import 'package:hotel_booking_app/ui/features/home/view_model/hotel_controller.dart';
import 'package:hotel_booking_app/ui/features/search/widgets/hotel_search_card.dart';
import 'package:hotel_booking_app/ui/features/search/widgets/section/filter_card.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _scrollController = ScrollController();
  final search = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    search.addListener(_onSearchChanged);
  }

  Future<void> _onSearchChanged() async {
    final searchController = context.read<HotelController>();

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
    final controller = Provider.of<HotelController>(context);

    return Scaffold(
      appBar: HBAppBar(
        isScrolled: false,
        title: context.l10n.titleSearch,
        color: context.colorScheme.onSurfaceVariant,
        onPressed: () => context.go(PageRoutes.homePage),
      ),
      body: Padding(
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
                    child: HBTextField(
                      controller: search,
                      hintText: context.l10n.search,
                      color: Colors.transparent,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await filterCard(context);
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
                padding: const EdgeInsets.symmetric(horizontal: 4),
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
                              : controller.listRecomended;
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
