import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/routes/app_router.dart';
import 'package:hotel_booking_app/screens/auth/widget/socail_section.dart';
import 'package:hotel_booking_app/screens/home/main_home_screen.dart';
import 'package:hotel_booking_app/services/auth_service.dart';
import 'package:hotel_booking_app/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/utils/validator.dart';
import 'package:hotel_booking_app/screens/auth/widget/circular_checkbox%20.dart';
import 'package:hotel_booking_app/widgets/hb_texfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool isCheckbox = false;
  String? error;

  // login
  Future<void> logIn() async {
    if (_formKey.currentState!.validate()) {
      final response = await AuthService().signInUser(
        _email.text,
        _password.text,
      );

      if (response == 'sucess') {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.loginSucess)),
        );
        await Navigator.push(context, animationRouter(const MainHomeScreen()));
      } else {
        setState(() => error = response);
      }
    }
  }

  // error text
  Widget _buildErrorText() =>
      error == null
          ? const SizedBox.shrink()
          : Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              error!,
              style: context.textTheme.bodyLarge!.copyWith(
                color: context.colorScheme.error,
              ),
              textAlign: TextAlign.center,
            ),
          );

  // or sign in with
  Widget _buildDividerWithText(String text) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Container(height: 1.5, color: context.colorScheme.outline),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          text,
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.outline,
          ),
        ),
      ),
      Expanded(
        child: Container(height: 1.5, color: context.colorScheme.outline),
      ),
    ],
  );

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: context.iconTheme.color),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    translate.signInTitle,
                    style: GoogleFonts.jost(
                      textStyle: context.textTheme.displaySmall!.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    translate.signInDesc,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                _buildErrorText(),
                const SizedBox(height: 15),
                Text(
                  translate.emailAddress,
                  style: context.textTheme.headlineSmall!.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 10),
                HBTexField(
                  controller: _email,
                  hintText: translate.enterEmail,
                  validator: (v) => validatorEmail(context, v),
                ),
                const SizedBox(height: 15),
                Text(
                  translate.password,
                  style: context.textTheme.headlineSmall!.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 10),
                HBTexField(
                  controller: _password,
                  hintText: translate.enterPassword,
                  isPassword: true,
                  validator: (v) => validatePassword(context, v),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircularCheckbox(size: 28, isCheckbox: false),
                          const SizedBox(width: 8),
                          Text(
                            translate.checkbox,
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: context.colorScheme.onSurfaceVariant
                                  .withValues(alpha: 0.5),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          translate.forgotPassword,
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: context.colorScheme.error,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryBtn(
                  textButton: translate.signIn,
                  onPressed: logIn,
                  bold: false,
                ),
                const SizedBox(height: 30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        translate.noAccount,
                        style: context.textTheme.headlineSmall!.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      TextButton(
                        onPressed:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const SignIn()),
                            ),
                        child: Text(
                          translate.signUp,
                          style: GoogleFonts.roboto(
                            textStyle: context.textTheme.headlineSmall!
                                .copyWith(color: context.colorScheme.primary),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                _buildDividerWithText(translate.orSignIn),
                const SizedBox(height: 25),
                SocailSection(error: error),
                const SizedBox(height: 40),
                Center(
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                      children: [
                        TextSpan(text: translate.textFooterOne),
                        TextSpan(
                          text: ' ${translate.textFooterTwo}\n',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextSpan(text: translate.textFooterThree),
                        TextSpan(
                          text: translate.textFooterFour,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
