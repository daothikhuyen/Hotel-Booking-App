import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/utils/translation_helper.dart';
import 'package:hotel_booking_app/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/features/home/controller/navigation_controller.dart';
import 'package:provider/provider.dart';

class LayoutScaffold extends StatefulWidget {
  const LayoutScaffold({required this.navigationShell, Key? key})
    : super(key: key ?? const ValueKey<String>('LayoutScaffold'));

  final StatefulNavigationShell navigationShell;

  @override
  State<LayoutScaffold> createState() => _LayoutScaffoldState();
}

class _LayoutScaffoldState extends State<LayoutScaffold> {
  late NavigationController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller = Provider.of<NavigationController>(context, listen: false);
      controller.fetchNavigationBar(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<NavigationController>(context);

    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.outline,
              offset: const Offset(0, -5),
              blurRadius: 60,
            ),
          ],
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((
              states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return HBTextStyles.bodySemiboldSmall(
                  context.colorScheme.primary,
                );
              }
              return HBTextStyles.bodyMediumSmall(
                context.colorScheme.onTertiary,
              );
            }),
          ),
          child: NavigationBar(
            selectedIndex: widget.navigationShell.currentIndex,
            indicatorColor: Colors.transparent,
            onDestinationSelected: widget.navigationShell.goBranch,
            destinations:
                controller.listDestinations.length >= 2
                    ? controller.listDestinations.map<NavigationDestination>((
                      d,
                    ) {
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
                      const Skeleton(width: double.infinity, height: 30),
                      const Skeleton(width: double.infinity, height: 30),
                    ],
          ),
        ),
      ),
    );
  }
}
