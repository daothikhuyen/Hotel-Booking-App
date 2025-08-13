import 'package:flutter/material.dart';
import 'package:hotel_booking_app/routes/app_router.dart';
import 'package:hotel_booking_app/screens/home/main_home_screen.dart';
import 'package:hotel_booking_app/services/auth_service.dart';
import 'package:hotel_booking_app/widgets/auth/social_item.dart';

// ignore: must_be_immutable
class SocailSection extends StatelessWidget {
  SocailSection({super.key, this.error});

  String? error;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialItem(
          linkIcon: 'assets/images/icon/Icon - Google.svg',
          onPressed: () async {
            String response = await AuthService().signInUserWithGoogle();
            if (response == 'sucess') {
              ScaffoldMessenger.of(
                // ignore: use_build_context_synchronously
                context,
              ).showSnackBar(SnackBar(content: Text("SignIn Sucess")));
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
        SocialItem(
          linkIcon: 'assets/images/icon/Icon - Apple.svg',
          onPressed: () {},
        ),
        SizedBox(width: 10),
        SocialItem(
          linkIcon: 'assets/images/icon/Icon - Facebook.svg',
          onPressed: () {},
        ),
      ],
    );
  }
}
