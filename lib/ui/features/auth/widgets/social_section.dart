import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/data/repositories/api_status.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/routing/page_routes.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/loading_overlay.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/ui/features/auth/view_model/auth_controller.dart';
import 'package:hotel_booking_app/ui/features/auth/widgets/social_item.dart';
import 'package:provider/provider.dart';

class SocailSection extends StatefulWidget {
  const SocailSection({super.key, this.error});

  final String? error;

  @override
  State<SocailSection> createState() => _SocailSectionState();
}

class _SocailSectionState extends State<SocailSection> {
  String? error;
  final snackBar = HBSnackBar();
  final LoadingOverlay loadingOverlay = LoadingOverlay();

  @override
  Widget build(BuildContext context) {
    final authenContrller = Provider.of<AuthController>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialItem(
          linkIcon: Assets.images.icon.iconGoogle,
          onPressed: () async {
            try {
              loadingOverlay.showLoading(context);
              final result = await authenContrller.signInWithGoogle(context);
              if (result.status == ApiStatus.error) {
                snackBar.showSnackBar(context, result.message);
              } else {
                authenContrller.setUser(result.data);
                context.go(PageRoutes.homePage);
              }
            } finally {
              Navigator.pop(context);
            }
          },
        ),
        const SizedBox(width: 10),
        SocialItem(linkIcon: Assets.images.icon.iconApple, onPressed: () {}),
        const SizedBox(width: 10),
        SocialItem(linkIcon: Assets.images.icon.iconFacebook, onPressed: () {}),
      ],
    );
  }
}
