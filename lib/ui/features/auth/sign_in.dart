import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/loading_overlay.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/ui/core/widgets/textfield.dart';
import 'package:hotel_booking_app/ui/features/auth/controller/auth_controller.dart';
import 'package:hotel_booking_app/ui/features/auth/widgets/remmenber_checkbox.dart';
import 'package:hotel_booking_app/ui/features/auth/widgets/social_section.dart';

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
  final ValueNotifier<bool> isFormValid = ValueNotifier(false);

  bool isTicked = false;
  bool isSubmitted = false;
  bool _obscureText = true;
  String? error;

  void _updateButtonState() {
    final isEmailValid = validateEmail(context, _email.text) == null;
    final isPasswordValid = validatePassword(context, _password.text) == null;

    isFormValid.value = isEmailValid && isPasswordValid;
  }

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
          padding: EdgeInsets.symmetric(horizontal: context.spacing.lg.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.spacing.md.h),
                Center(
                  child: Text(
                    context.l10n.signInTitle,
                    style: HBTextStyles.headingThree(
                      context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: context.spacing.sm.h),
                Center(
                  child: Text(
                    context.l10n.signInDesc,
                    style: HBTextStyles.bodyRegularSmall(
                      context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: context.spacing.lg.h),
                Text(
                  context.l10n.emailAddress,
                  style: HBTextStyles.bodySemiboldSmall(
                    context.colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: context.spacing.md.h),
                HBTextField(
                  controller: _email,
                  hintText: context.l10n.enterEmail,
                  validator: (v) => validateEmail(context, v),
                  onChanged: (_) => _updateButtonState(),
                  color: context.colorScheme.outline,
                ),
                SizedBox(height: context.spacing.lg.h),
                Text(
                  context.l10n.password,
                  style: HBTextStyles.bodySemiboldSmall(
                    context.colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: context.spacing.md.h),
                HBTextField(
                  controller: _password,
                  hintText: context.l10n.enterPassword,
                  isPassword: true,
                  validator: (v) => validatePassword(context, v),
                  onChanged: (_) => _updateButtonState(),
                  color: context.colorScheme.outline,
                  obscureText: _obscureText,
                  onToggleObscureText: () {
                    setState(() => _obscureText = !_obscureText);
                  },
                ),
                FormField<bool>(
                  initialValue: isTicked,
                  validator: (value) {
                    return null;
                    // TODOS: will do in the future
                  },
                  builder: (field) {
                    return Padding(
                      padding: EdgeInsets.only(top: context.spacing.lg.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              RemmenberCheckbox(size: 28.r, isTicked: false),
                              SizedBox(width: context.spacing.sm.w),
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
                SizedBox(height: context.spacing.lg.h),
                SizedBox(
                  width: double.infinity,
                  child: ValueListenableBuilder(
                    valueListenable: isFormValid,
                    builder: (context, isValue, child) {
                      return PrimaryBtn(
                        size: 46.h,
                        textButton: context.l10n.signIn,
                        onPressed:
                            isValue
                                ? () async {
                                  try {
                                    loadingOverlay.showLoading(context);
                                    final result = await authController.signIn(
                                      context: context,
                                      formKey: _formKey,
                                      email: _email.text,
                                      password: _password.text,
                                    );
                                    if (result.status == ApiStatus.error &&
                                        result.message.isNotEmpty) {
                                      snackBar.showSnackBar(
                                        context,
                                        result.message,
                                      );
                                    } else {
                                      authController.setUser(result.data);
                                      context.go(PageRoutes.homePage);
                                    }
                                  } finally {
                                    Navigator.pop(context);
                                  }
                                }
                                : () {},
                        bold: false,
                        isSelected: isValue,
                      );
                    },
                  ),
                ),
                SizedBox(height: context.spacing.lg.h),
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
                DividerWithText(text: context.l10n.orSignIn),
                SocailSection(error: error),
                SizedBox(height: context.spacing.xl),
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
                SizedBox(height: context.spacing.xl.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
