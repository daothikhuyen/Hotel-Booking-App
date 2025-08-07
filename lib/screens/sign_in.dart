import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/theme/app_colors.dart';
import 'package:hotel_booking_app/widgets/circular_checkbox%20.dart';
import 'package:hotel_booking_app/widgets/customer_button.dart';
import 'package:hotel_booking_app/widgets/social_button.dart';

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

  void LogIn() {

  if(_formKey.currentState!.validate()){
    print('ho');
  }
}


// validator for email
  String? validatorEmail(String? value) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value == null || value.isEmpty) {
      return 'Please entern your email';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email format';
    }

    return null;
  }

// validator for password  
  String? validatePassword(String? value) {

    if (value == null || value.isEmpty) {
      return 'Please entern your password';
    } else if (value.length < 8) {
      return 'Password must be at least 6 characters long';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
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
                    "Let's Sign Your In",
                    style: GoogleFonts.jost().copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur",
                    style: TextStyle(color: Color(0xFF434E58)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Email Address',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailInput,
                  validator: validatorEmail,
                  decoration: InputDecoration(
                    hintText: 'Enter your email address',
                    filled: true,
                    fillColor: Color(0xFFF6F6F6),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF9CA4AB),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                ),
                SizedBox(height: 15),
                Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _password,
                  validator: validatePassword,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF9CA4AB),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF6F6F6),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility_off),
                      onPressed: () {},
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
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
                          Text('Remember Me'),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(color: AppColors.error),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                CustomerButton(
                  textButton: 'Sign In',
                  onPressed: LogIn,
                  bold: false,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w600,
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
                          "Sign Up",
                          style: GoogleFonts.roboto().copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
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
                        'Or Sign In With',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF9CA4AB),
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
                    SocialButton(
                      linkIcon: 'assets/images/icon/Icon - Google.svg',
                    ),
                    SizedBox(width: 10),
                    SocialButton(
                      linkIcon: 'assets/images/icon/Icon - Apple.svg',
                    ),
                    SizedBox(width: 10),
                    SocialButton(
                      linkIcon: 'assets/images/icon/Icon - Facebook.svg',
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'By signing up you agree to our ',
                            style: TextStyle(color: AppColors.textColor),
                          ),
                          Text(
                            'Terms',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'and',
                            style: TextStyle(color: AppColors.textColor),
                          ),
                          Text(
                            ' Conditions of Use',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
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
