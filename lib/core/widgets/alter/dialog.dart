import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/response/api_status.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/widgets/alter/loading_overlay.dart';
import 'package:hotel_booking_app/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/core/widgets/buttons/second_btn.dart';
import 'package:hotel_booking_app/features/auth/controller/auth_controller.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:provider/provider.dart';

class HBDialog{
  
    Future<void> showAlertDialog({
    required BuildContext context,
    required String title,
    required String desc,
    required bool isAction,
    required bool isClose,
    required VoidCallback action,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        final actionsList = <Widget>[];

        if (isAction) {
          actionsList.add(
            TextButton(onPressed: action, child: Text(context.l10n.oK)),
          );
        }

        if (isClose) {
          actionsList.add(
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.l10n.close),
            ),
          );
        }

        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(color: context.colorScheme.onSurfaceVariant),
          ),
          content: Text(
            desc,
            style: TextStyle(color: context.colorScheme.onSurfaceVariant),
          ),
          actions: [...actionsList],
        );
      },
    );
  }

  Future<void> showSignOutDialog(BuildContext context) {
    final authController = Provider.of<AuthController>(context, listen: false);

    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
            height: 311,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(Assets.images.icon.question),
                const SizedBox(height: 18),
                Text(
                  context.l10n.areYouSure,
                  style: HBTextStyles.bodySemiboldLarge(
                    context.colorScheme.onSurface,
                  ),
                ),
                Text(
                  context.l10n.doYouWantToLogout,
                  style: HBTextStyles.bodyRegularSmall(
                    context.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SecondBtn(
                        titleBtn: context.l10n.logout,
                        color: context.colorScheme.error,
                        radiusSize: 12,
                        size: 46,
                        onPressed: () async {
                          context.replace(PageRoutes.signIn);
                          LoadingOverlay().showLoading(context);
                          final result = await authController.signOut(context);

                          if (result.status == ApiStatus.error) {
                            context.pop();
                            HBSnackBar().showSnackBar(context, result.message);
                            context.replace(PageRoutes.profile);
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: PrimaryBtn(
                        textButton: context.l10n.cancel,
                        onPressed: () {
                          context.pop(context);
                        },
                        bold: true,
                        size: 46,
                        isSelected: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
