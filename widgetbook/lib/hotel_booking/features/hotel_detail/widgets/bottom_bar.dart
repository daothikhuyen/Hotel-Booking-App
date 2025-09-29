import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/data/model/user.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/features/hotel_detail/widgets/bottom_bar.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;


@widgetbook.UseCase(name: 'Default', type: BottomBar)
Widget buildBottomBarUseCase(BuildContext context) {
  return Center(
    child: Stack(
      children: [
        BottomBar(
            user: HBUser(uid: 'hi', email: 'daothikhuyen28@gmail.com'),
            hotel: Hotel(
              id: '1',
              image: Assets.images.home.frameOne.path,
              name: 'Fan Hu',
              location: 'Hi Li',
              roomType: 'Single',
              categoryId: 'Zk2IvTj6oXRPto2qaUgM',
              discount: false
            ),
          ),
      ],
    ),
  );
}
