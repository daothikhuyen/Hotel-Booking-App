import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/data/onboarding_data.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/features/auth/sign_in.dart';
import 'package:hotel_booking_app/features/onboarding/widgets/onboarding_card.dart';
import 'package:hotel_booking_app/features/auth/services/auth_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen> {
  static final PageController _pageController = PageController(initialPage: 0);
  final authService = AuthService();

  int _currentPage = 0;

  List<Widget> _onBoardingPages(BuildContext context) {
    return onboardingData.asMap().entries.map((entry) {
      final index = entry.key;
      final d = entry.value;
      return OnboardingCard(
        images: d['image']!,
        title: d['title']!,
        desc: d['desc']!,
        textButton: d['textButton']!,
        onPressed: () {
          if (index < onboardingData.length - 1) {
            _pageController.animateToPage(
              index + 1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignIn()),
            );
          }
        },
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page != _currentPage) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: _onBoardingPages(context),
          ),
          if (_currentPage < onboardingData.length - 1)
            Positioned(
              bottom: 150,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: onboardingData.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: context.colorScheme.primary,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
