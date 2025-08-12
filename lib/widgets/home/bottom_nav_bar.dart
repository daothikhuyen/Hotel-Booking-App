import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking_app/model/destination.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.all(TextStyle(color: Colors.white)),
      ),
      child: NavigationBar(
        elevation: 0,
        selectedIndex: _selectedIndex,
        indicatorColor: Theme.of(context).colorScheme.primary,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        destinations:
            destinations.map<NavigationDestination>((d) {
              return NavigationDestination(
                icon: SvgPicture.asset(
                  d.icon,
                  // ignore: deprecated_member_use
                  color: Theme.of(context).iconTheme.color,
                ),
                selectedIcon: SvgPicture.asset(
                  d.icon,
                  // ignore: deprecated_member_use
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: d.labelKey,
              );
            }).toList(),
      ),
    );
  }
}
