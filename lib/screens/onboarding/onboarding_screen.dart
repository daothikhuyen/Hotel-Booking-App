import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/routes/app_router.dart';
import 'package:hotel_booking_app/screens/sign_in.dart';
import 'package:hotel_booking_app/theme/app_colors.dart';
import 'package:hotel_booking_app/widgets/customer_button.dart';
import '../../data/onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  void nextPage() {
    if (_currentIndex < onboardingData.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        animationRouter(SignIn())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemBuilder: (context, index) {
              final item = onboardingData[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(item['image']!, fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF110C1D), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: const [0.2, 0.8],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 35.0,
                      left: 20,
                      right: 20,
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item['title']!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.jost().copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            item['desc']!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.jost().copyWith(
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 20),
                          index < onboardingData.length - 1
                              ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  onboardingData.length,
                                  (dotIndex) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    width: _currentIndex == dotIndex ? 24 : 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          _currentIndex == dotIndex
                                              ? AppColors.primary
                                              : const Color(0xFFBFC6CC),
                                    ),
                                  ),
                                ),
                              )
                              : SizedBox.shrink(),
                          const SizedBox(height: 30),
                          CustomerButton(textButton: item['nameButton']!, onPressed: nextPage, bold: true),
                          const SizedBox(height: 20),
                          if (item['nameButton']! == 'Get Started')
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account ?",
                                  style: TextStyle(color: Colors.white),
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
                                    "Register",
                                    style: GoogleFonts.roboto().copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          else
                            const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
