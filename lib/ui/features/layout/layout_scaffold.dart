import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/features/home/view_model/navigation_controller.dart';
import 'package:hotel_booking_app/ui/features/layout/bottom_nav_bar.dart';
import 'package:hotel_booking_app/ui/features/layout/side_nav_rail.dart';

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
    final useSideNavRail = MediaQuery.sizeOf(context).width >= 600;

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ipad, Desktop: NavigationRail
          if (useSideNavRail)
            Expanded(
              child: SideNavRail(
                widget: widget,
                controller: controller,
              ),
            ),
          Expanded(flex: 7, child: widget.navigationShell),
        ],
      ),

      // Mobile: BottomNavigationBar
      bottomNavigationBar:
          useSideNavRail
              ? null
              : BottomNavBar(widget: widget, controller: controller),
    );
  }
}
