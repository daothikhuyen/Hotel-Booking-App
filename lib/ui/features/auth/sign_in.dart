import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/data/repositories/api_status.dart';
import 'package:hotel_booking_app/routing/page_routes.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/loading_overlay.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/ui/core/widgets/textfield.dart';
import 'package:hotel_booking_app/ui/features/auth/view_model/auth_controller.dart';
import 'package:hotel_booking_app/ui/features/auth/widgets/circular_checkbox.dart';
import 'package:hotel_booking_app/ui/features/auth/widgets/social_section.dart';
import 'package:hotel_booking_app/utils/validator.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final snackBar = HBSnackBar();
  final loadingOverlay = LoadingOverlay();
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool isCheckbox = false;
  bool isSubmitted = false;
  bool _obscureText = true;
  String? error;

  // or sign in with
  Widget _buildDividerWithText(String text) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Container(height: 1.5, color: context.colorScheme.outline),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: context.spacing.sm),
        child: Text(
          text,
          style: HBTextStyles.bodyRegularSmall(context.colorScheme.outline),
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
    final authController = Provider.of<AuthController>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go(PageRoutes.homePage);
          },
          icon: Icon(Icons.arrow_back, color: context.iconTheme.color),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.spacing.xl),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.spacing.xl),
                Center(
                  child: Text(
                    context.l10n.signInTitle,
                    style: HBTextStyles.headingThree(
                      context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: context.spacing.sm),
                Center(
                  child: Text(
                    context.l10n.signInDesc,
                    style: HBTextStyles.bodyRegularSmall(
                      context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: context.spacing.lg),
                Text(
                  context.l10n.emailAddress,
                  style: HBTextStyles.bodySemiboldSmall(
                    context.colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: context.spacing.md),
                HBTextField(
                  controller: _email,
                  hintText: context.l10n.enterEmail,
                  validator: (v) => validateEmail(context, v),
                  color: context.colorScheme.outline,
                ),
                SizedBox(height: context.spacing.lg),
                Text(
                  context.l10n.password,
                  style: HBTextStyles.bodySemiboldSmall(
                    context.colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: context.spacing.md),
                HBTextField(
                  controller: _password,
                  hintText: context.l10n.enterPassword,
                  isPassword: true,
                  validator: (v) => validatePassword(context, v),
                  color: context.colorScheme.outline,
                  obscureText: _obscureText,
                  onToggleObscureText: () {
                    setState(() => _obscureText = !_obscureText);
                  },
                ),
                FormField<bool>(
                  initialValue: isCheckbox,
                  validator: (value) {
                    return null;
                    // TODOS: will do in the future
                  },
                  builder: (field) {
                    return Padding(
                      padding: EdgeInsets.only(top: context.spacing.lg),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircularCheckbox(
                                size: 28,
                                isCheckbox: false,
                              ),
                              SizedBox(width: context.spacing.sm),
                              Text(
                                context.l10n.checkbox,
                                style: HBTextStyles.bodyRegularSmall(
                                  context.colorScheme.onSurfaceVariant
                                      .withValues(alpha: 0.5),
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              context.l10n.forgotPassword,
                              style: HBTextStyles.bodyRegularSmall(
                                context.colorScheme.error,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: context.spacing.xl),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryBtn(
                    size: 56,
                    textButton: context.l10n.signIn,
                    onPressed: () async {
                      try {
                        isSubmitted = true;
                        loadingOverlay.showLoading(context);
                        final result = await authController.signIn(
                          context: context,
                          formKey: _formKey,
                          email: _email.text,
                          password: _password.text,
                        );
                        if (result.status == ApiStatus.error &&
                            result.message != '') {
                          snackBar.showSnackBar(context, result.message);
                        } else {
                          authController.setUser(result.data);
                          context.go(PageRoutes.homePage);
                        }
                      } finally {
                        Navigator.pop(context);
                      }
                    },
                    bold: false,
                    isSelected: true,
                  ),
                ),
                SizedBox(height: context.spacing.xxl),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.l10n.noAccount,
                        style: HBTextStyles.bodySemiboldMedium(
                          context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.push(PageRoutes.signIn),
                        child: Text(
                          context.l10n.signUp,
                          style: GoogleFonts.roboto(
                            textStyle: HBTextStyles.bodySemiboldSmall(
                              context.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.spacing.xxl),
                _buildDividerWithText(context.l10n.orSignIn),
                SizedBox(height: context.spacing.xxl),
                SocailSection(error: error),
                SizedBox(height: context.spacing.huge),
                Center(
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                      children: [
                        TextSpan(text: context.l10n.textFooterOne),
                        TextSpan(
                          text: ' ${context.l10n.textFooterTwo}\n',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextSpan(text: context.l10n.textFooterThree),
                        TextSpan(
                          text: context.l10n.textFooterFour,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: context.spacing.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
