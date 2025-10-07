import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/dialog.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/second_btn.dart';
import 'package:hotel_booking_app/ui/features/auth/controller/auth_controller.dart';
import 'package:hotel_booking_app/ui/features/profile/controller/profile_controller.dart';
import 'package:hotel_booking_app/ui/features/profile/widgets/setting_section.dart';

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
          left: context.spacing.lg.w,
          right: context.spacing.lg.r,
          top: context.spacing.md.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (user?.email != null)
                SizedBox(
                  height: 53.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: context.spacing.sm.w),
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
                              SizedBox(height: context.spacing.xs.h),
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
                        child: SvgPicture.asset(
                          Assets.images.icon.editSquare,
                          width: 20.w,
                          height: 20.h,
                        ),
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
                        size: 46.h,
                        radiusSize: 12.r,
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
                        size: 46.h,
                        isSelected: true,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: context.spacing.lg.h),
              const SettingSection(), // setting
              if (user?.email != null)
                Padding(
                  padding: EdgeInsets.only(top: context.spacing.xs.h),
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
