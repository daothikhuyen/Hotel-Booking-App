import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/widgets/list/list_vertical.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_hotel_booking_app/hotel_booking/data_fake/hotel_data.dart';

@widgetbook.UseCase(name: 'Default', type: ListVertical)
Widget buildListVerticalUseCase(BuildContext context) {
  final List<Hotel> listHotels =
      hotelData.map((e) => Hotel.fromJson(e, '123')).toList();

  return Padding(
    padding: const EdgeInsets.only(top: 18, left: 18),
    child: ListVertical(
      listHotels,
      context.knobs.string(
        label: 'Title',
        initialValue: 'Recommended For you',
      ),
      context.knobs.string(
        label: 'See All',
        initialValue: 'See All',
      ),
      context.knobs.int.input(
        label: 'Number',
        initialValue: 2,
      ),
    ),
  );
}
