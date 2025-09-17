import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/widgets/alter/page_alter_null.dart';
import 'package:hotel_booking_app/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/core/widgets/textfield.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/home/controller/hotel_controller.dart';
import 'package:hotel_booking_app/features/search/widgets/hotel_search_card.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _scrollController = ScrollController();
  final search = TextEditingController();
  List<Hotel> listHotelSearch = [];
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
      listHotelSearch = await searchController.searchHotel(context, text: text);
      setState(() {});
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
                    child: HBTexField(
                      controller: search,
                      hintText: context.l10n.search,
                      color: Colors.transparent,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        isScrollControlled: true,
                        builder: (context) {
                          return const SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                //TODOS:...,
                              ],
                            ),
                          );
                        },
                      );
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
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    final listSearch =
                        search.text.isNotEmpty
                            ? listHotelSearch
                            : controller.listRecomended;
                    return listSearch.isNotEmpty
                        ? ListView.builder(
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
          ],
        ),
      ),
    );
  }
}
