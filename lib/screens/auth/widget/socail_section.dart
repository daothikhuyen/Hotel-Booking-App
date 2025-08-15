import 'package:flutter/material.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/routes/app_router.dart';
import 'package:hotel_booking_app/screens/home/main_home_screen.dart';
import 'package:hotel_booking_app/services/auth_service.dart';
import 'package:hotel_booking_app/screens/auth/widget/social_item.dart';

class SocailSection extends StatefulWidget {
  const SocailSection({super.key, this.error});

  final String? error;

  @override
  State<SocailSection> createState() => _SocailSectionState();
}

class _SocailSectionState extends State<SocailSection> {
  String? error;

  @override
  Widget build(BuildContext context) {
    Future<void> logInWithGoogle() async {
      final String response = await AuthService().signInUserWithGoogle();

      if (!mounted) return;
      if (response == 'sucess') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.loginSucess)),);
        await Navigator.push(context, animationRouter(const MainHomeScreen()));
      } else {
        setState(() {
          error = response;
        });
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialItem(
          linkIcon: Assets.images.icon.iconGoogle,
          onPressed: logInWithGoogle,
        ),
        const SizedBox(width: 10),
        SocialItem(
          linkIcon: Assets.images.icon.iconApple,
          onPressed: () {},
        ),
        const SizedBox(width: 10),
        SocialItem(
          linkIcon: Assets.images.icon.iconFacebook,
          onPressed: () {},
        ),
      ],
    );
  }
}
