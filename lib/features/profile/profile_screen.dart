import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/widgets/alter/diaglog.dart';
import 'package:hotel_booking_app/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/core/widgets/buttons/second_btn.dart';
import 'package:hotel_booking_app/features/auth/controller/auth_controller.dart';
import 'package:hotel_booking_app/features/profile/widgets/setting_section.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthController>(context);
    final user = userProvider.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            context.l10n.profile,
            style: HBTextStyles.bodySemiboldLarge(
              context.colorScheme.onSurface,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (user?.email != null)
              SizedBox(
                height: 57,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image:
                                  user?.photoURL != ''
                                      ? NetworkImage(user?.photoURL ?? '')
                                      : AssetImage(
                                            Assets.images.avatar.ellipse.path,
                                          )
                                          as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user?.displayName ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: HBTextStyles.bodySemiboldMedium(
                                  context.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                            Text(
                              user?.location ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: HBTextStyles.bodyMediumSmall(
                                  context.colorScheme.tertiary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset(Assets.images.icon.editSquare),
                  ],
                ),
              )
            else
              Row(
                children: [
                  Expanded(
                    child: SecondBtn(
                      titleBtn: context.l10n.signIn,
                      color: context.colorScheme.primary,
                      size: 46,
                      radiusSize: 12,
                      onPressed: () {
                        context.push(PageRoutes.signIn);
                      },
                    ),
                  ),
                  Expanded(
                    child: PrimaryBtn(
                      textButton: context.l10n.signUp,
                      onPressed: () {},
                      bold: true,
                      size: 46,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 50),
            const SettingSection(), // setting
            if (user?.email != null)
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Center(
                  child: TextButton(
                    onPressed: () => HBDiaglog().showSignOutDialog(context),
                    child: Text(
                      context.l10n.logout,
                      style: HBTextStyles.bodySemiboldLarge(
                        context.colorScheme.error,
                      ),
                    ),
                  ),
                ),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
