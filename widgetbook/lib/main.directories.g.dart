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
import 'package:widgetbook_HotelBookingApp/hotel_booking/core/widgets/common/category_item.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_core_widgets_common_category_item;
import 'package:widgetbook_HotelBookingApp/hotel_booking/core/widgets/common/primary_btn.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_core_widgets_common_primary_btn;
import 'package:widgetbook_HotelBookingApp/hotel_booking/core/widgets/header_bar.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_core_widgets_header_bar;
import 'package:widgetbook_HotelBookingApp/hotel_booking/features/auth/sign_in.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_features_auth_sign_in;
import 'package:widgetbook_HotelBookingApp/hotel_booking/features/home/main_home.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_features_home_main_home;
import 'package:widgetbook_HotelBookingApp/hotel_booking/features/home/widgets/items/best_today_item.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_features_home_widgets_items_best_today_item;
import 'package:widgetbook_HotelBookingApp/hotel_booking/features/home/widgets/items/most_popular_item.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_features_home_widgets_items_most_popular_item;
import 'package:widgetbook_HotelBookingApp/hotel_booking/features/home/widgets/items/recommended_item.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_features_home_widgets_items_recommended_item;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'core',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'widgets',
        children: [
          _widgetbook.WidgetbookLeafComponent(
            name: 'HeaderBar',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder:
                  _widgetbook_HotelBookingApp_hotel_booking_core_widgets_header_bar
                      .buildHeaderBarUseCase,
            ),
          ),
          _widgetbook.WidgetbookFolder(
            name: 'buttons',
            children: [
              _widgetbook.WidgetbookLeafComponent(
                name: 'PrimaryBtn',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_HotelBookingApp_hotel_booking_core_widgets_common_primary_btn
                          .buildPrimaryBtnUseCase,
                ),
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'cards',
            children: [
              _widgetbook.WidgetbookLeafComponent(
                name: 'BestTodayItem',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_HotelBookingApp_hotel_booking_features_home_widgets_items_best_today_item
                          .buildBestTodayItemUseCase,
                ),
              ),
              _widgetbook.WidgetbookLeafComponent(
                name: 'MostPopularItem',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_HotelBookingApp_hotel_booking_features_home_widgets_items_most_popular_item
                          .buildMostPopularItemUseCase,
                ),
              ),
              _widgetbook.WidgetbookLeafComponent(
                name: 'RecomendedItem',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_HotelBookingApp_hotel_booking_features_home_widgets_items_recommended_item
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
                      _widgetbook_HotelBookingApp_hotel_booking_core_widgets_common_category_item
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
          _widgetbook.WidgetbookLeafComponent(
            name: 'SignIn',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder:
                  _widgetbook_HotelBookingApp_hotel_booking_features_auth_sign_in
                      .buildSignInUseCase,
            ),
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'home',
        children: [
          _widgetbook.WidgetbookLeafComponent(
            name: 'MainHomeScreen',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder:
                  _widgetbook_HotelBookingApp_hotel_booking_features_home_main_home
                      .buildMainHomeUseCase,
            ),
          ),
        ],
      ),
    ],
  ),
];
