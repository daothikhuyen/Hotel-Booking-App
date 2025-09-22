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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
  /// **'Best Today 🔥'**
  String get bestToday;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @hotel.
  ///
  /// In en, this message translates to:
  /// **'Hotel'**
  String get hotel;

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

  /// No description provided for @detailRecommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get detailRecommended;

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
  /// **'/night'**
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

  /// No description provided for @signInFailed.
  ///
  /// In en, this message translates to:
  /// **'Sign in failed. Please try again.'**
  String get signInFailed;

  /// No description provided for @signInSucess.
  ///
  /// In en, this message translates to:
  /// **'Sign in sucess'**
  String get signInSucess;

  /// No description provided for @errorEmptyEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
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

  /// No description provided for @traffic.
  ///
  /// In en, this message translates to:
  /// **'({traffic})'**
  String traffic(int traffic);

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'{price}'**
  String price(String price);

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @oK.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get oK;

  /// No description provided for @signOutFailed.
  ///
  /// In en, this message translates to:
  /// **'Sign Out failed'**
  String get signOutFailed;

  /// No description provided for @signUpFailed.
  ///
  /// In en, this message translates to:
  /// **'Sign up failed. Please try again.'**
  String get signUpFailed;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Network error. Check your connection.'**
  String get networkError;

  /// No description provided for @userNotExisted.
  ///
  /// In en, this message translates to:
  /// **'You are not logged in.\n Please log in to continue booking'**
  String get userNotExisted;

  /// No description provided for @hotelNotExisted.
  ///
  /// In en, this message translates to:
  /// **'Data does not exist'**
  String get hotelNotExisted;

  /// No description provided for @titleDetail.
  ///
  /// In en, this message translates to:
  /// **'Detail'**
  String get titleDetail;

  /// No description provided for @commonFacilities.
  ///
  /// In en, this message translates to:
  /// **'Common Facilities'**
  String get commonFacilities;

  /// No description provided for @titlePrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get titlePrice;

  /// No description provided for @buttonBooking.
  ///
  /// In en, this message translates to:
  /// **'Booking Now'**
  String get buttonBooking;

  /// No description provided for @restaurant.
  ///
  /// In en, this message translates to:
  /// **'Restaurant'**
  String get restaurant;

  /// No description provided for @swimmingPool.
  ///
  /// In en, this message translates to:
  /// **'Swimming\n Pool'**
  String get swimmingPool;

  /// No description provided for @timeHours.
  ///
  /// In en, this message translates to:
  /// **'24-Hours\n Front Desk'**
  String get timeHours;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @noReviews.
  ///
  /// In en, this message translates to:
  /// **'No reviews yet'**
  String get noReviews;

  /// No description provided for @descriptionHotel.
  ///
  /// In en, this message translates to:
  /// **'The ideal place for those looking for a luxurious and tranquil holiday experience with stunning sea views. The ideal place for those looking for a luxurious and tranquil holiday experience with stunning sea views'**
  String get descriptionHotel;

  /// No description provided for @titleRequestBooking.
  ///
  /// In en, this message translates to:
  /// **'Request to book'**
  String get titleRequestBooking;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Dates'**
  String get date;

  /// No description provided for @checkIn.
  ///
  /// In en, this message translates to:
  /// **'Check - In'**
  String get checkIn;

  /// No description provided for @checkOut.
  ///
  /// In en, this message translates to:
  /// **'Check - Out'**
  String get checkOut;

  /// No description provided for @guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// No description provided for @numberGuest.
  ///
  /// In en, this message translates to:
  /// **'{numberGuest} Guests({numberRoom} Room)'**
  String numberGuest(int numberGuest, int numberRoom);

  /// No description provided for @payWith.
  ///
  /// In en, this message translates to:
  /// **'Pay With'**
  String get payWith;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @paymentDetails.
  ///
  /// In en, this message translates to:
  /// **'Payment Details'**
  String get paymentDetails;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total: {total} Night'**
  String total(int total);

  /// No description provided for @cleaningFee.
  ///
  /// In en, this message translates to:
  /// **'Cleaning Fee'**
  String get cleaningFee;

  /// No description provided for @serviceFee.
  ///
  /// In en, this message translates to:
  /// **'Service Fee'**
  String get serviceFee;

  /// No description provided for @totalPayment.
  ///
  /// In en, this message translates to:
  /// **'Total Payment'**
  String get totalPayment;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// No description provided for @titleCheckOut.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get titleCheckOut;

  /// No description provided for @roomType.
  ///
  /// In en, this message translates to:
  /// **'Room Type'**
  String get roomType;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @priceDetails.
  ///
  /// In en, this message translates to:
  /// **'Price Details'**
  String get priceDetails;

  /// No description provided for @yourBooking.
  ///
  /// In en, this message translates to:
  /// **'Your Booking'**
  String get yourBooking;

  /// No description provided for @adminFee.
  ///
  /// In en, this message translates to:
  /// **'Admin Fee'**
  String get adminFee;

  /// No description provided for @totalPrice.
  ///
  /// In en, this message translates to:
  /// **'Total Price'**
  String get totalPrice;

  /// No description provided for @promo.
  ///
  /// In en, this message translates to:
  /// **'Promo'**
  String get promo;

  /// No description provided for @selectPayment.
  ///
  /// In en, this message translates to:
  /// **'Select Payment'**
  String get selectPayment;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @startDateMustBeFuture.
  ///
  /// In en, this message translates to:
  /// **'Start date must be in the future'**
  String get startDateMustBeFuture;

  /// No description provided for @notifiBookingFailure.
  ///
  /// In en, this message translates to:
  /// **'Please select complete information'**
  String get notifiBookingFailure;

  /// No description provided for @notifiBookingSucess.
  ///
  /// In en, this message translates to:
  /// **'You have successfully booked a room'**
  String get notifiBookingSucess;

  /// No description provided for @paymentComplete.
  ///
  /// In en, this message translates to:
  /// **'Payment Complete'**
  String get paymentComplete;

  /// No description provided for @contentPaymentComplete.
  ///
  /// In en, this message translates to:
  /// **'Etiam cras nec metus laoreet. Faucibus \n iaculis cras ut posuere.'**
  String get contentPaymentComplete;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get search;

  /// No description provided for @titleSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get titleSearch;

  /// No description provided for @perNight.
  ///
  /// In en, this message translates to:
  /// **'Per Night'**
  String get perNight;

  /// No description provided for @bed.
  ///
  /// In en, this message translates to:
  /// **'{bed} bed'**
  String bed(int bed);

  /// No description provided for @bathroom.
  ///
  /// In en, this message translates to:
  /// **'{bathroom} bathroom'**
  String bathroom(int bathroom);

  /// No description provided for @booked.
  ///
  /// In en, this message translates to:
  /// **'Booked'**
  String get booked;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @bookingDetail.
  ///
  /// In en, this message translates to:
  /// **'Booking Detail'**
  String get bookingDetail;

  /// No description provided for @yourHotel.
  ///
  /// In en, this message translates to:
  /// **'Your Hotel'**
  String get yourHotel;

  /// No description provided for @yourCard.
  ///
  /// In en, this message translates to:
  /// **'Your Card'**
  String get yourCard;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languages;

  /// No description provided for @help_support.
  ///
  /// In en, this message translates to:
  /// **'Help and Support'**
  String get help_support;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No Hotel Data'**
  String get noData;

  /// No description provided for @areYouSure.
  ///
  /// In en, this message translates to:
  /// **'Are You Sure'**
  String get areYouSure;

  /// No description provided for @doYouWantToLogout.
  ///
  /// In en, this message translates to:
  /// **'Do You Want To Logout'**
  String get doYouWantToLogout;

  /// No description provided for @nightlyRate.
  ///
  /// In en, this message translates to:
  /// **'Nightly Rate'**
  String get nightlyRate;

  /// No description provided for @nightsCount.
  ///
  /// In en, this message translates to:
  /// **'Nights Count'**
  String get nightsCount;

  /// No description provided for @nameBank.
  ///
  /// In en, this message translates to:
  /// **'Name Bank'**
  String get nameBank;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @linkImage.
  ///
  /// In en, this message translates to:
  /// **'Link Image'**
  String get linkImage;

  /// No description provided for @ratting.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get ratting;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @isCheckBox.
  ///
  /// In en, this message translates to:
  /// **'Is Checkbox'**
  String get isCheckBox;

  /// No description provided for @isScrolled.
  ///
  /// In en, this message translates to:
  /// **'Is Scrolled'**
  String get isScrolled;

  /// No description provided for @hintText.
  ///
  /// In en, this message translates to:
  /// **'Hint Text'**
  String get hintText;

  /// No description provided for @titleButton.
  ///
  /// In en, this message translates to:
  /// **'Title Button'**
  String get titleButton;

  /// No description provided for @trafic.
  ///
  /// In en, this message translates to:
  /// **'Traffic'**
  String get trafic;

  /// No description provided for @lastPrice.
  ///
  /// In en, this message translates to:
  /// **'Last Price'**
  String get lastPrice;

  /// No description provided for @bold.
  ///
  /// In en, this message translates to:
  /// **'Bold'**
  String get bold;

  /// No description provided for @buttonPressed.
  ///
  /// In en, this message translates to:
  /// **'Button Pressed'**
  String get buttonPressed;

  /// No description provided for @overlayMessage.
  ///
  /// In en, this message translates to:
  /// **'Overlay Message'**
  String get overlayMessage;

  /// No description provided for @roomCount.
  ///
  /// In en, this message translates to:
  /// **'Room Count'**
  String get roomCount;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter By'**
  String get filter;

  /// No description provided for @applyFilter.
  ///
  /// In en, this message translates to:
  /// **'Apply Filter'**
  String get applyFilter;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get personalInfo;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @apartement.
  ///
  /// In en, this message translates to:
  /// **'Apartement'**
  String get apartement;

  /// No description provided for @villas.
  ///
  /// In en, this message translates to:
  /// **'Villas'**
  String get villas;

  /// No description provided for @suggestedLanguages.
  ///
  /// In en, this message translates to:
  /// **'Suggested Languages'**
  String get suggestedLanguages;

  /// No description provided for @otherLanguages.
  ///
  /// In en, this message translates to:
  /// **'Other Languages'**
  String get otherLanguages;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @vietnamese.
  ///
  /// In en, this message translates to:
  /// **'VietNamese'**
  String get vietnamese;

  /// No description provided for @errorNotEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please do not leave blank'**
  String get errorNotEmpty;

  /// No description provided for @errorNumberPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone number is not in correct format'**
  String get errorNumberPhone;

  /// No description provided for @displayName.
  ///
  /// In en, this message translates to:
  /// **'Display Name'**
  String get displayName;

  /// No description provided for @updateSucess.
  ///
  /// In en, this message translates to:
  /// **'Update successful'**
  String get updateSucess;

  /// No description provided for @updateFailed.
  ///
  /// In en, this message translates to:
  /// **'Update failed'**
  String get updateFailed;
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
