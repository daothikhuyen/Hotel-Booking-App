// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _widgetbook;
import 'package:widgetbook_hotel_booking_app/hotel_booking/core/widgets/common/category_item.dart'
    as _widgetbook_hotel_booking_app_hotel_booking_core_widgets_common_category_item;
import 'package:widgetbook_hotel_booking_app/hotel_booking/core/widgets/common/primary_btn.dart'
    as _widgetbook_hotel_booking_app_hotel_booking_core_widgets_common_primary_btn;
import 'package:widgetbook_hotel_booking_app/hotel_booking/core/widgets/common/second_btn.dart'
    as _widgetbook_hotel_booking_app_hotel_booking_core_widgets_common_second_btn;
import 'package:widgetbook_hotel_booking_app/hotel_booking/core/widgets/header_bar.dart'
    as _widgetbook_hotel_booking_app_hotel_booking_core_widgets_header_bar;
import 'package:widgetbook_hotel_booking_app/hotel_booking/features/auth/widgets/circular_checkbox.dart'
    as _widgetbook_hotel_booking_app_hotel_booking_features_auth_widgets_circular_checkbox;
import 'package:widgetbook_hotel_booking_app/hotel_booking/features/auth/widgets/social_item.dart'
    as _widgetbook_hotel_booking_app_hotel_booking_features_auth_widgets_social_item;
import 'package:widgetbook_hotel_booking_app/hotel_booking/features/home/main_home.dart'
    as _widgetbook_hotel_booking_app_hotel_booking_features_home_main_home;
import 'package:widgetbook_hotel_booking_app/hotel_booking/features/home/widgets/items/best_today_item.dart'
    as _widgetbook_hotel_booking_app_hotel_booking_features_home_widgets_items_best_today_item;
import 'package:widgetbook_hotel_booking_app/hotel_booking/features/home/widgets/items/most_popular_item.dart'
    as _widgetbook_hotel_booking_app_hotel_booking_features_home_widgets_items_most_popular_item;
import 'package:widgetbook_hotel_booking_app/hotel_booking/features/home/widgets/items/recommended_item.dart'
    as _widgetbook_hotel_booking_app_hotel_booking_features_home_widgets_items_recommended_item;
import 'package:widgetbook_hotel_booking_app/hotel_booking/features/hotel_detail/widgets/bottom_bar.dart'
    as _widgetbook_hotel_booking_app_hotel_booking_features_hotel_detail_widgets_bottom_bar;
import 'package:widgetbook_hotel_booking_app/hotel_booking/features/hotel_detail/widgets/facilities_card.dart'
    as _widgetbook_hotel_booking_app_hotel_booking_features_hotel_detail_widgets_facilities_card;
import 'package:widgetbook_hotel_booking_app/hotel_booking/features/hotel_detail/widgets/review_card.dart'
    as _widgetbook_hotel_booking_app_hotel_booking_features_hotel_detail_widgets_review_card;
import 'package:widgetbook_hotel_booking_app/hotel_booking/features/my_booking/widgets/booking_skeleton.dart'
    as _widgetbook_hotel_booking_app_hotel_booking_features_my_booking_widgets_booking_skeleton;
import 'package:widgetbook_hotel_booking_app/hotel_booking/features/my_booking/widgets/my_booking_card.dart'
    as _widgetbook_hotel_booking_app_hotel_booking_features_my_booking_widgets_my_booking_card;
import 'package:widgetbook_hotel_booking_app/hotel_booking/features/onBoarding/widgets/onboarding_card.dart'
    as _widgetbook_hotel_booking_app_hotel_booking_features_onBoarding_widgets_onboarding_card;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'core',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'widgets',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'buttons',
            children: [
              _widgetbook.WidgetbookLeafComponent(
                name: 'PrimaryBtn',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_hotel_booking_app_hotel_booking_core_widgets_common_primary_btn
                          .buildPrimaryBtnUseCase,
                ),
              ),
              _widgetbook.WidgetbookLeafComponent(
                name: 'SecondBtn',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_hotel_booking_app_hotel_booking_core_widgets_common_second_btn
                          .buildPrimaryBtnUseCase,
                ),
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'cards',
            children: [
              _widgetbook.WidgetbookLeafComponent(
                name: 'BestTodayCard',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_hotel_booking_app_hotel_booking_features_home_widgets_items_best_today_item
                          .buildBestTodayItemUseCase,
                ),
              ),
              _widgetbook.WidgetbookLeafComponent(
                name: 'RecomendedCard',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_hotel_booking_app_hotel_booking_features_home_widgets_items_recommended_item
                          .buildRecomendedItemUseCase,
                ),
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'category',
            children: [
              _widgetbook.WidgetbookLeafComponent(
                name: 'CategoryItem',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_hotel_booking_app_hotel_booking_core_widgets_common_category_item
                          .buildFilterBarUseCase,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'features',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'auth',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'widgets',
            children: [
              _widgetbook.WidgetbookLeafComponent(
                name: 'CircularCheckbox',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_hotel_booking_app_hotel_booking_features_auth_widgets_circular_checkbox
                          .buildCircularCheckbocUseCase,
                ),
              ),
              _widgetbook.WidgetbookLeafComponent(
                name: 'SocialItem',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_hotel_booking_app_hotel_booking_features_auth_widgets_social_item
                          .buildSocailItemUseCase,
                ),
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'home',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'widgets',
            children: [
              _widgetbook.WidgetbookLeafComponent(
                name: 'HeaderBar',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_hotel_booking_app_hotel_booking_core_widgets_header_bar
                          .buildHeaderBarUseCase,
                ),
              ),
              _widgetbook.WidgetbookFolder(
                name: 'card',
                children: [
                  _widgetbook.WidgetbookLeafComponent(
                    name: 'PopularCard',
                    useCase: _widgetbook.WidgetbookUseCase(
                      name: 'Default',
                      builder:
                          _widgetbook_hotel_booking_app_hotel_booking_features_home_widgets_items_most_popular_item
                              .buildMostPopularItemUseCase,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'hotel_detail',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'widgets',
            children: [
              _widgetbook.WidgetbookLeafComponent(
                name: 'BottomBar',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_hotel_booking_app_hotel_booking_features_hotel_detail_widgets_bottom_bar
                          .buildBottomBarUseCase,
                ),
              ),
              _widgetbook.WidgetbookLeafComponent(
                name: 'FacilitiesCard',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_hotel_booking_app_hotel_booking_features_hotel_detail_widgets_facilities_card
                          .buildMainHomeUseCase,
                ),
              ),
              _widgetbook.WidgetbookLeafComponent(
                name: 'ReviewCard',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_hotel_booking_app_hotel_booking_features_hotel_detail_widgets_review_card
                          .buildMainHomeUseCase,
                ),
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'layout',
        children: [
          _widgetbook.WidgetbookLeafComponent(
            name: 'LayoutScaffold',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder:
                  _widgetbook_hotel_booking_app_hotel_booking_features_home_main_home
                      .buildMainHomeUseCase,
            ),
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'my_booking',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'widgets',
            children: [
              _widgetbook.WidgetbookLeafComponent(
                name: 'BookingCard',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_hotel_booking_app_hotel_booking_features_my_booking_widgets_my_booking_card
                          .buildBookingCardUseCase,
                ),
              ),
              _widgetbook.WidgetbookLeafComponent(
                name: 'BookingSkeleton',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_hotel_booking_app_hotel_booking_features_my_booking_widgets_booking_skeleton
                          .buildBookingSkeletonUseCase,
                ),
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'onboarding',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'widgets',
            children: [
              _widgetbook.WidgetbookLeafComponent(
                name: 'OnboardingCard',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_hotel_booking_app_hotel_booking_features_onBoarding_widgets_onboarding_card
                          .buildMainHomeUseCase,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
