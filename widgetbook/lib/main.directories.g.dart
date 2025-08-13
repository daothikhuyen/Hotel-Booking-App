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
import 'package:widgetbook_HotelBookingApp/hotel_booking/screens/auth/sign_in.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_screens_auth_sign_in;
import 'package:widgetbook_HotelBookingApp/hotel_booking/screens/home/main_home.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_screens_home_main_home;
import 'package:widgetbook_HotelBookingApp/hotel_booking/widgets/common/category_item.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_widgets_common_category_item;
import 'package:widgetbook_HotelBookingApp/hotel_booking/widgets/common/primary_btn.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_widgets_common_primary_btn;
import 'package:widgetbook_HotelBookingApp/hotel_booking/widgets/home/header_bar.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_widgets_home_header_bar;
import 'package:widgetbook_HotelBookingApp/hotel_booking/widgets/home/items/most_popular_item.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_widgets_home_items_most_popular_item;
import 'package:widgetbook_HotelBookingApp/hotel_booking/widgets/home/items/recommended_item.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_widgets_home_items_recommended_item;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'screens',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'auth',
        children: [
          _widgetbook.WidgetbookLeafComponent(
            name: 'SignIn',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder:
                  _widgetbook_HotelBookingApp_hotel_booking_screens_auth_sign_in
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
                  _widgetbook_HotelBookingApp_hotel_booking_screens_home_main_home
                      .buildMainHomeUseCase,
            ),
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'common',
        children: [
          _widgetbook.WidgetbookLeafComponent(
            name: 'CategoryItem',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder:
                  _widgetbook_HotelBookingApp_hotel_booking_widgets_common_category_item
                      .buildFilterBarUseCase,
            ),
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'PrimaryBtn',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder:
                  _widgetbook_HotelBookingApp_hotel_booking_widgets_common_primary_btn
                      .buildPrimaryBtnUseCase,
            ),
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'home',
        children: [
          _widgetbook.WidgetbookLeafComponent(
            name: 'HeaderBar',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder:
                  _widgetbook_HotelBookingApp_hotel_booking_widgets_home_header_bar
                      .buildHeaderBarUseCase,
            ),
          ),
          _widgetbook.WidgetbookFolder(
            name: 'items',
            children: [
              _widgetbook.WidgetbookLeafComponent(
                name: 'MostPopularItem',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_HotelBookingApp_hotel_booking_widgets_home_items_most_popular_item
                          .buildMostPopularItemUseCase,
                ),
              ),
              _widgetbook.WidgetbookLeafComponent(
                name: 'RecomendedItem',
                useCase: _widgetbook.WidgetbookUseCase(
                  name: 'Default',
                  builder:
                      _widgetbook_HotelBookingApp_hotel_booking_widgets_home_items_recommended_item
                          .buildRecomendedItemUseCase,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
