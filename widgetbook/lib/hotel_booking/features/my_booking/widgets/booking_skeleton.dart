import 'package:flutter/material.dart';
import 'package:hotel_booking_app/features/my_booking/widgets/booking_skeleton.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: BookingSkeleton)
Widget buildBookingSkeletonUseCase(BuildContext context) {
  return BookingSkeleton();
}