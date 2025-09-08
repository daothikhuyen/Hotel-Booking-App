import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/features/onboarding/widgets/onboarding_card.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_hotel_booking_app/gen/assets.gen.dart';

@widgetbook.UseCase(name: 'Default', type: OnboardingCard)
Widget buildMainHomeUseCase(BuildContext context) {
  return OnboardingCard(
    images: context.knobs.string(
      label: 'Link Image',
      initialValue: Assets.images.onboarding.a02OnBoarding1.path,
    ),
    title: context.knobs.string(
      label: 'Title',
      initialValue: context.l10n.onboardingTitleOne,
    ),
    desc: context.knobs.string(
      label: 'Description',
      initialValue: context.l10n.descriptionHotel,
    ),
    textButton: context.knobs.string(
      label: 'Text Button',
      initialValue: 'Contiune',
    ),
    onPressed: () {},
  );
}
