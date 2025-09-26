import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/data/model/user.dart';
import 'package:hotel_booking_app/routing/page_routes.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/dialog.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/ui/features/auth/sign_in.dart';
import 'package:hotel_booking_app/utils/format.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({required this.hotel, super.key, this.user});

  final Hotel hotel;
  final HBUser? user;

  @override
  Widget build(BuildContext context) {
    final hbDialog = HBDialog();

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.outline,
              offset: const Offset(0, -5),
              blurRadius: 60,
            ),
          ],
        ),
        height: 95,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.titlePrice,
                    style: HBTextStyles.bodyRegularSmall(
                      context.colorScheme.tertiary,
                    ),
                  ),
                  if (hotel.currentPrice != 0)
                    Text(
                      context.l10n.price(
                        formatPrice(hotel.currentPrice ?? 0.000),
                      ),
                      style: HBTextStyles.headingThree(
                        context.colorScheme.inverseSurface,
                      ),
                    )
                  else
                    const Skeleton(width: 7, height: 30),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: PrimaryBtn(
                size: 56,
                textButton: context.l10n.buttonBooking,
                onPressed: () {
                  if (user != null) {
                    context.push(PageRoutes.requestBooking, extra: hotel);
                  } else {
                    hbDialog.showAlertDialog(
                      context: context,
                      title: context.l10n.notification,
                      desc: context.l10n.userNotExisted,
                      isAction: true,
                      isClose: true,
                      action: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                        );
                      },
                    );
                  }
                },
                bold: true,
                isSelected: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
