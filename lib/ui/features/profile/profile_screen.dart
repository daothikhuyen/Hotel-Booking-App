import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/routing/page_routes.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/dialog.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/second_btn.dart';
import 'package:hotel_booking_app/ui/features/auth/view_model/auth_controller.dart';
import 'package:hotel_booking_app/ui/features/profile/view_model/profile_controller.dart';
import 'package:hotel_booking_app/ui/features/profile/widgets/setting_section.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileController(),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final hbDialog = HBDialog();
    final userProvider = Provider.of<AuthController>(context);
    final user = userProvider.currentUser;
    final photoURL = user?.photoURL ?? '';

    final imageProvider =
        photoURL.isNotEmpty
            ? NetworkImage(photoURL)
            : AssetImage(Assets.images.avatar.ellipse.path) as ImageProvider;

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
        padding: EdgeInsets.only(
          left: context.spacing.lg,
          right: context.spacing.lg,
          top: context.spacing.xl,
        ),
        child: SingleChildScrollView(
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
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: context.spacing.sm),
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
                      GestureDetector(
                        onTap: () {
                          context.push(PageRoutes.personalInfo);
                        },
                        child: SvgPicture.asset(Assets.images.icon.editSquare),
                      ),
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
                        isSelected: true,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: context.spacing.huge),
              const SettingSection(), // setting
              if (user?.email != null)
                Padding(
                  padding: EdgeInsets.only(top:  context.spacing.xs),
                  child: Center(
                    child: TextButton(
                      onPressed: () => hbDialog.showSignOutDialog(context),
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
      ),
    );
  }
}
