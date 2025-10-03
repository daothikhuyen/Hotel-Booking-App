import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/ui/features/home/view_model/navigation_controller.dart';
import 'package:hotel_booking_app/ui/features/layout/layout_scaffold.dart';
import 'package:hotel_booking_app/utils/translation_helper.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.widget, required this.controller, super.key,
  });

  final LayoutScaffold widget;
  final NavigationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.outline,
            offset: const Offset(0, -5),
            blurRadius: 60.r,
          ),
        ],
      ),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return HBTextStyles.bodySemiboldSmall(
                  context.colorScheme.primary,
                );
              }
              return HBTextStyles.bodyMediumSmall(
                context.colorScheme.onTertiary,
              );
            },
          ),
        ),
        child: NavigationBar(
          selectedIndex: widget.navigationShell.currentIndex,
          indicatorColor: Colors.transparent,
          onDestinationSelected: widget.navigationShell.goBranch,
          destinations:
              controller.listDestinations.length >= 2
                  ? controller.listDestinations.map((d) {
                    return NavigationDestination(
                      icon: SvgPicture.asset(d.icon),
                      selectedIcon: SvgPicture.asset(
                        d.icon,
                        colorFilter: ColorFilter.mode(
                          context.colorScheme.primary,
                          BlendMode.srcIn,
                        ),
                        fit: BoxFit.cover,
                      ),
                      label: getTranslatedText(context, d.labelKey),
                    );
                  }).toList()
                  : [
                    Skeleton(
                      width: double.infinity,
                      height: context.spacing.xxl,
                    ),
                    Skeleton(
                      width: double.infinity,
                      height: context.spacing.xxl,
                    ),
                  ],
        ),
      ),
    );
  }
}
