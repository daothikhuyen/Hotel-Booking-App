import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.isScrolled,
  });

  final bool isScrolled;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration:
            isScrolled
                ? BoxDecoration(
                  color: context.colorScheme.surface,
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color: context.colorScheme.outline,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: context.colorScheme.onTertiary,
                      offset: Offset(0, -1),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                )
                : BoxDecoration(),
        child: Padding(
          padding: EdgeInsets.only(
            top: 40,
            bottom: 10,
            right: 20,
            left: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color:
                      isScrolled
                          ? context.colorScheme.onSurfaceVariant
                          : context.colorScheme.onSecondary,
                ),
              ),
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.titleDetail,
                  style: CustomTextStyles.bodySemiboldLarge(
                    isScrolled
                          ? context.colorScheme.onSurfaceVariant
                          : context.colorScheme.onSecondary,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                child: Icon(
                  Icons.more_vert,
                  color:
                      isScrolled
                          ? context.colorScheme.onSurfaceVariant
                          : context.colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}