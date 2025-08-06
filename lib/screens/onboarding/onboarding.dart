import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              OnBoardingPage(
                image: 'assets/images/onboarding/02 - On Boarding #1.png',
                title: 'Luxury and Comfort, Just a Tap Away',
                descripsion:
                    'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem . ',
                nameButton: 'Continue',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.descripsion,
    required this.nameButton,
  });

  final String image;
  final String title;
  final String descripsion;
  final String nameButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding/02 - On Boarding #1.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
