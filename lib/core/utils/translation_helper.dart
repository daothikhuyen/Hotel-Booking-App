import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';

String getTranslatedText(BuildContext context, String key) {
  switch (key) {
    case 'onboardingTitleOne':
      return context.l10n.onboardingTitleOne;
    case 'onboardingTitleTwo':
      return context.l10n.onboardingTitleTwo;
    case 'onboardingTitleThree':
      return context.l10n.onboardingTitleThree;
    case 'onboardingDescOne':
      return context.l10n.onboardingDescOne;
    case 'onboardingDescTwo':
      return context.l10n.onboardingDescTwo;
    case 'onboardingDescThree':
      return context.l10n.onboardingDescThree;
    case 'contiune':
      return context.l10n.onboardingContiune;
    case 'getStarted':
      return context.l10n.onboardingStarted;
    case 'Home':
      return context.l10n.home;
    case 'My Booking':
      return context.l10n.mybooking;
    case 'Message':
      return context.l10n.message;
    case 'Profile':
      return context.l10n.profile;
    case 'Hotel':
      return context.l10n.tagHotel;
    case 'Apartement':
      return context.l10n.tagApartement;
    case 'Swimming Pool':
      return context.l10n.swimmingPool;
    case '24-Hours Front Desk':
      return context.l10n.timeHours;
    default:
      return key;
  }
}
