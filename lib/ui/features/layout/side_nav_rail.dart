import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/ui/features/home/view_model/navigation_controller.dart';
import 'package:hotel_booking_app/ui/features/layout/layout_scaffold.dart';
import 'package:hotel_booking_app/utils/translation_helper.dart';

class SideNavRail extends StatelessWidget {
  const SideNavRail({
    required this.widget,
    required this.controller,
    super.key,
  });

  final LayoutScaffold widget;
  final NavigationController controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final iconSize = constraints.maxWidth.toStringAsFixed(2);
        return Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 20, 19, 19),
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.outline,
                offset: const Offset(-5, 0),
                blurRadius: 60,
              ),
            ],
          ),
          child: NavigationRail(
            selectedIndex: widget.navigationShell.currentIndex,
            onDestinationSelected: widget.navigationShell.goBranch,
            labelType: NavigationRailLabelType.all,
            indicatorColor: Colors.transparent,
            groupAlignment: 0,
            destinations:
                controller.listDestinations.length >= 2
                    ? controller.listDestinations.map((d) {
                      final isSelected =
                          controller.listDestinations.indexOf(d) ==
                          widget.navigationShell.currentIndex;
                      return NavigationRailDestination(
                        icon: Padding(
                          padding: EdgeInsets.all(context.spacing.md),
                          child: SvgPicture.asset(
                            d.icon,
                            width: double.parse(iconSize) * 0.3,
                            height: double.parse(iconSize) * 0.3,
                          ),
                        ),
                        selectedIcon: Padding(
                          padding: EdgeInsets.all(context.spacing.sm),
                          child: SvgPicture.asset(
                            d.icon,
                            colorFilter: ColorFilter.mode(
                              context.colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                            width: double.parse(iconSize) * 0.3,
                            height: double.parse(iconSize) * 0.3,
                          ),
                        ),
                        label: Text(
                          getTranslatedText(context, d.labelKey),
                          style:
                              isSelected
                                  ? HBTextStyles.bodySemiboldXLarge(
                                    context.colorScheme.primary,
                                  )
                                  : HBTextStyles.bodyMediumXLarge(
                                    context.colorScheme.onTertiary,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }).toList()
                    : [
                      NavigationRailDestination(
                        icon: Skeleton(
                          width: constraints.maxHeight * 0.3,
                          height: constraints.maxHeight * 0.4,
                        ),
                        label: const Text(''),
                      ),
                      NavigationRailDestination(
                        icon: Skeleton(
                          width: constraints.maxHeight * 0.3,
                          height: constraints.maxHeight * 0.4,
                        ),
                        label: const Text(''),
                      ),
                    ],
          ),
        );
      },
    );
  }
}
