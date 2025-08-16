import 'package:flutter/material.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';

String getTranslatedText(BuildContext context, String key) {
  switch (key) {
    case 'onboardingTitleOne':
      return AppLocalizations.of(context)!.onboardingTitleOne;
    case 'onboardingTitleTwo':
      return AppLocalizations.of(context)!.onboardingTitleTwo;
    case 'onboardingTitleThree':
      return AppLocalizations.of(context)!.onboardingTitleThree;
    case 'onboardingDescOne':
      return AppLocalizations.of(context)!.onboardingDescOne;
    case 'onboardingDescTwo':
      return AppLocalizations.of(context)!.onboardingDescTwo;
    case 'onboardingDescThree':
      return AppLocalizations.of(context)!.onboardingDescThree;
    case 'contiune':
      return AppLocalizations.of(context)!.onboardingContiune;
    case 'getStarted':
      return AppLocalizations.of(context)!.onboardingStarted;
    case 'Home':
      return AppLocalizations.of(context)!.home;
    case 'My Booking':
      return AppLocalizations.of(context)!.mybooking;
    case 'Message':
      return AppLocalizations.of(context)!.message;
    case 'Profile':
      return AppLocalizations.of(context)!.profile;
    case 'Hotel':
      return AppLocalizations.of(context)!.tagHotel;
    case 'Apartement':
      return AppLocalizations.of(context)!.tagApartement;
    default:
      return key;
  }
}
