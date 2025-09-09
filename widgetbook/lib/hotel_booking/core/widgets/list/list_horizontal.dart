import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/widgets/list/list_horizontal.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_hotel_booking_app/gen/assets.gen.dart';
import 'package:widgetbook_hotel_booking_app/hotel_booking/data_fake/hotel_data.dart';

@widgetbook.UseCase(name: 'Default', type: ListHorizontal)
Widget buildListVerticalUseCase(BuildContext context) {
  final List<Hotel> listHotels =
      hotelData.map((e) => Hotel.fromJson(e, '123')).toList();

  return ListHorizontal(
    listHotels,
    context.knobs.string(
      label: 'Title',
      initialValue: 'Recommended For you',
    ),
    context.knobs.string(
      label: 'See All',
      initialValue: Assets.images.icon.iconApple,
    ),
    context.knobs.int.input(
      label: 'Number',
      initialValue: 123,
    ),
  );
}
