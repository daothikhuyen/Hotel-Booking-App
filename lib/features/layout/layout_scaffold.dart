import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/utils/translation_helper.dart';
import 'package:hotel_booking_app/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/data/model/destination.dart';
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
  List<Destination> listDestination = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final controller = Provider.of<NavigationController>(
        context,
        listen: false,
      );
      final destinations = await controller.fetchNavigationBar();

      setState(() {
        listDestination = destinations;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: widget.navigationShell,
    bottomNavigationBar: NavigationBarTheme(
      data: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(color: context.colorScheme.primary);
          }
          return TextStyle(color: context.colorScheme.onSurfaceVariant);
        }),
      ),
      child: NavigationBar(
        selectedIndex: widget.navigationShell.currentIndex,
        backgroundColor: context.colorScheme.surface,
        indicatorColor: Colors.transparent,
        onDestinationSelected: widget.navigationShell.goBranch,
        destinations:
            listDestination.length >= 2
                ? listDestination.map<NavigationDestination>((d) {
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
  );
}
