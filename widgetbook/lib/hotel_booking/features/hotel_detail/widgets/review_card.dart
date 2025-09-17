import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/data/comment_user.dart';
import 'package:hotel_booking_app/data/model/comment.dart';
import 'package:hotel_booking_app/data/model/user.dart';
import 'package:hotel_booking_app/features/hotel_detail/widgets/review_card.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ReviewCard)
Widget buildMainHomeUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: ReviewCard(
          comment: CommentWithUser(
            comment: Comment(
              idUser: 'u1',
              idHotel: 'h1',
              rating: 4.5,
              content: 'Great hotel',
            ),
            user: HBUser(
              displayName: 'John Doe',
              email: 'daothikhuyen@gmail.com',
              location: 'Vietnam',
              uid: 'dsdsdsd',
            ),
          ),
        ),
      ),
    ],
  );
}
