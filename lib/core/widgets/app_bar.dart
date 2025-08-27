import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';

class HBAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HBAppBar({
    required this.title,
    required this.isScrolled,
    required this.color,
    super.key,
  });

  final bool isScrolled;
  final String title;
  final Color color;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    offset: const Offset(0, -1),
                    blurRadius: 10,
                  ),
                ],
              )
              : const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.only(
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
                context.pop();
              },
              child: Icon(
                Icons.arrow_back,
                color:
                    isScrolled ? context.colorScheme.onSurfaceVariant : color,
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: HBTextStyles.bodySemiboldLarge(
                  isScrolled ? context.colorScheme.onSurfaceVariant : color,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              child: Icon(
                Icons.more_vert,
                color:
                    isScrolled ? context.colorScheme.onSurfaceVariant : color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
