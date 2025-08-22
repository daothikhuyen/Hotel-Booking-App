import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/features/auth/controller/auth_controller.dart';
import 'package:hotel_booking_app/features/auth/widgets/social_item.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

class SocailSection extends StatefulWidget {
  const SocailSection({super.key, this.error});

  final String? error;

  @override
  State<SocailSection> createState() => _SocailSectionState();
}

class _SocailSectionState extends State<SocailSection> {
  String? error;
  final HBSnackBar snackBar = HBSnackBar();
  final AuthController authenContrller = AuthController();

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialItem(
          linkIcon: Assets.images.icon.iconGoogle,
          onPressed: () => authenContrller.signInWithGoogle(context),
        ),
        const SizedBox(width: 10),
        SocialItem(linkIcon: Assets.images.icon.iconApple, onPressed: () {}),
        const SizedBox(width: 10),
        SocialItem(linkIcon: Assets.images.icon.iconFacebook, onPressed: () {}),
      ],
    );
  }
}
