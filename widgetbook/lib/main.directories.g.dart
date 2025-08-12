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
import 'package:widgetbook_HotelBookingApp/hotel_booking/widgets/button/primary.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_widgets_button_primary;
import 'package:widgetbook_HotelBookingApp/hotel_booking/widgets/home/card_most_popular.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_widgets_home_card_most_popular;
import 'package:widgetbook_HotelBookingApp/hotel_booking/widgets/home/header_bar.dart'
    as _widgetbook_HotelBookingApp_hotel_booking_widgets_home_header_bar;

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
        name: 'button',
        children: [
          _widgetbook.WidgetbookLeafComponent(
            name: 'PrimaryBtn',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder:
                  _widgetbook_HotelBookingApp_hotel_booking_widgets_button_primary
                      .buildPrimaryBtnUseCase,
            ),
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'home',
        children: [
          _widgetbook.WidgetbookLeafComponent(
            name: 'CardMostPopular',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder:
                  _widgetbook_HotelBookingApp_hotel_booking_widgets_home_card_most_popular
                      .buildCardMostPopularUseCase,
            ),
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'HeaderBar',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder:
                  _widgetbook_HotelBookingApp_hotel_booking_widgets_home_header_bar
                      .buildHeaderBarUseCase,
            ),
          ),
        ],
      ),
    ],
  ),
];
