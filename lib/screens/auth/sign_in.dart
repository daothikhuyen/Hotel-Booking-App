import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/routes/app_router.dart';
import 'package:hotel_booking_app/screens/home/main_home_screen.dart';
import 'package:hotel_booking_app/services/auth_service.dart';
import 'package:hotel_booking_app/themes/app_colors.dart';
import 'package:hotel_booking_app/themes/theme.dart';
import 'package:hotel_booking_app/widgets/auth/circular_checkbox%20.dart';
import 'package:hotel_booking_app/widgets/button/primary_btn.dart';
import 'package:hotel_booking_app/widgets/auth/social_btn.dart';
import 'package:hotel_booking_app/widgets/auth/auth_text_field.dart';

import '../../utils/validator.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

// call api to login

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailInput = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool isCheckbox = false;
  String? error;

  // ignore: non_constant_identifier_names
  Future<void> LogIn() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailInput.text;
      String password = _password.text;

      String? response = await AuthService().signInUser(email, password);

      if (response == 'sucess') {
        ScaffoldMessenger.of(
          // ignore: use_build_context_synchronously
          context,
        ).showSnackBar(SnackBar(content: Text("SignIn Sucess")));
        // ignore: use_build_context_synchronously
        Navigator.push(context, animationRouter(MainHomeScreen()));
      } else {
        setState(() {
          error = response;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: Text(
                    AppLocalizations.of(context)!.signInTitle,
                    style: GoogleFonts.jost().copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  child: Text(
                    AppLocalizations.of(context)!.signInDesc,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 18),
                Align(
                  child: Text(
                    error ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  AppLocalizations.of(context)!.emailAddress,
                  style: CustomerTextStyles.suitableBoldTextStyle(
                    Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 10),
                AuthTextField(
                  controller: _emailInput,
                  hintText: AppLocalizations.of(context)!.enterEmail,
                  isPassword: false,
                  validator: (value) => validatorEmail(context, value),
                ),
                SizedBox(height: 15),
                Text(
                  AppLocalizations.of(context)!.password,
                  style: CustomerTextStyles.suitableBoldTextStyle(
                    Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 10),
                AuthTextField(
                  controller: _password,
                  hintText: AppLocalizations.of(context)!.enterPassword,
                  isPassword: true,
                  validator: (value) => validatePassword(context, value),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircularCheckbox(size: 28, isCheckbox: false),
                          SizedBox(width: 8),
                          Text(AppLocalizations.of(context)!.checkbox),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!.forgotPassword,
                          style: TextStyle(color: AppColors.error),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                PrimaryBtn(
                  textButton: AppLocalizations.of(context)!.signIn,
                  onPressed: LogIn,
                  bold: false,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.noAccount,
                        style: CustomerTextStyles.suitableBoldTextStyle(
                          Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      TextButton(
                        onPressed:
                            () => {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ),
                                );
                              }),
                            },

                        child: Text(
                          AppLocalizations.of(context)!.signUp,
                          style: GoogleFonts.roboto(
                            textStyle: CustomerTextStyles.suitableBoldTextStyle(
                              Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 55,
                      height: 1.5,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xFFE9EBED)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        AppLocalizations.of(context)!.orSignIn,
                        style: CustomerTextStyles.suitableTextStyle(
                          Color(0xFF9CA4AB),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 55,
                      height: 1.5,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xFFE9EBED)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialBtn(
                      linkIcon: 'assets/images/icon/Icon - Google.svg',
                      onPressed: () async {
                        String response =
                            await AuthService().signInUserWithGoogle();
                        if (response == 'sucess') {
                          ScaffoldMessenger.of(
                            // ignore: use_build_context_synchronously
                            context,
                          ).showSnackBar(
                            SnackBar(content: Text("SignIn Sucess")),
                          );
                          Navigator.push(
                            // ignore: use_build_context_synchronously
                            context,
                            animationRouter(MainHomeScreen()),
                          );
                        } else {
                          error = response;
                        }
                      },
                    ),
                    SizedBox(width: 10),
                    SocialBtn(
                      linkIcon: 'assets/images/icon/Icon - Apple.svg',
                      onPressed: () {},
                    ),
                    SizedBox(width: 10),
                    SocialBtn(
                      linkIcon: 'assets/images/icon/Icon - Facebook.svg',
                      onPressed: () {},
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Align(
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        children: [
                          TextSpan(text: AppLocalizations.of(context)!.textFooterOne),
                          TextSpan(
                            text: ' ${AppLocalizations.of(context)!.textFooterTwo}\n',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(text: AppLocalizations.of(context)!.textFooterThree),
                          TextSpan(
                            text: AppLocalizations.of(context)!.textFooterFour,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
