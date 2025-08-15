import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @agreeTerm.
  ///
  /// In en, this message translates to:
  /// **'By signing up you agree to our \nTerms \nand Conditions of Use'**
  String get agreeTerm;

  /// No description provided for @bestToday.
  ///
  /// In en, this message translates to:
  /// **'Best Today'**
  String get bestToday;

  /// No description provided for @checkbox.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get checkbox;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @homeRecommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended for you'**
  String get homeRecommended;

  /// No description provided for @locationTitle.
  ///
  /// In en, this message translates to:
  /// **'You Can Change Your Location to\n show nearby villas'**
  String get locationTitle;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @mostPopular.
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get mostPopular;

  /// No description provided for @mybooking.
  ///
  /// In en, this message translates to:
  /// **'My Booking'**
  String get mybooking;

  /// No description provided for @nearYou.
  ///
  /// In en, this message translates to:
  /// **'Hotel Near You'**
  String get nearYou;

  /// No description provided for @openMap.
  ///
  /// In en, this message translates to:
  /// **'Open Map'**
  String get openMap;

  /// No description provided for @night.
  ///
  /// In en, this message translates to:
  /// **'night'**
  String get night;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get noAccount;

  /// No description provided for @titleSplash.
  ///
  /// In en, this message translates to:
  /// **'Find Your Perfect Stay, Anytime, Anywhere'**
  String get titleSplash;

  /// No description provided for @onboardingDescOne.
  ///
  /// In en, this message translates to:
  /// **'Semper in cursus magna et eu varius\n nunc adipiscing. Elementum justo, laoreet\n  id sem . '**
  String get onboardingDescOne;

  /// No description provided for @onboardingDescThree.
  ///
  /// In en, this message translates to:
  /// **'Lorem Ipsum is simply dummy text of the printing and\n typesetting industry.'**
  String get onboardingDescThree;

  /// No description provided for @onboardingDescTwo.
  ///
  /// In en, this message translates to:
  /// **'Semper in cursus magna et eu varius\n nunc adipiscing. Elementum justo, laoreet\n id sem . '**
  String get onboardingDescTwo;

  /// No description provided for @onboardingContiune.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboardingContiune;

  /// No description provided for @onboardingStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingStarted;

  /// No description provided for @onboardingTitleOne.
  ///
  /// In en, this message translates to:
  /// **'Luxury and Comfort,\n Just a Tap Away'**
  String get onboardingTitleOne;

  /// No description provided for @onboardingTitleTwo.
  ///
  /// In en, this message translates to:
  /// **'Book with Ease, Stay \n with Style'**
  String get onboardingTitleTwo;

  /// No description provided for @onboardingTitleThree.
  ///
  /// In en, this message translates to:
  /// **'Discover Your Dream \n Hotel, Effortlessly'**
  String get onboardingTitleThree;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get enterEmail;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPassword;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signInDesc.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, consectetur'**
  String get signInDesc;

  /// No description provided for @signInTitle.
  ///
  /// In en, this message translates to:
  /// **'Let’s Sign you in'**
  String get signInTitle;

  /// No description provided for @orSignIn.
  ///
  /// In en, this message translates to:
  /// **'Or Sign In With'**
  String get orSignIn;

  /// No description provided for @textFooterOne.
  ///
  /// In en, this message translates to:
  /// **'By signing up you agree to our'**
  String get textFooterOne;

  /// No description provided for @textFooterTwo.
  ///
  /// In en, this message translates to:
  /// **'Term'**
  String get textFooterTwo;

  /// No description provided for @textFooterThree.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get textFooterThree;

  /// No description provided for @textFooterFour.
  ///
  /// In en, this message translates to:
  /// **'Conditions of Use'**
  String get textFooterFour;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @errorEmptyEmail.
  ///
  /// In en, this message translates to:
  /// **'Please entern your email'**
  String get errorEmptyEmail;

  /// No description provided for @errorEmptyPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get errorEmptyPassword;

  /// No description provided for @errorEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get errorEmailFormat;

  /// No description provided for @errorPasswordFormat.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long'**
  String get errorPasswordFormat;

  /// No description provided for @loginSucess.
  ///
  /// In en, this message translates to:
  /// **'Login Sucess'**
  String get loginSucess;

  /// No description provided for @tagAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get tagAll;

  /// No description provided for @tagApartement.
  ///
  /// In en, this message translates to:
  /// **'Apartement\n'**
  String get tagApartement;

  /// No description provided for @tagHotel.
  ///
  /// In en, this message translates to:
  /// **'Hotels'**
  String get tagHotel;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
