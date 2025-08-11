import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking_app/model/destination.dart';
import 'package:hotel_booking_app/theme/app_colors.dart';

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
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(color: Colors.white),
          ),
        ),
        child: NavigationBar(
          elevation: 0,
          selectedIndex: _selectedIndex,
          indicatorColor: AppColors.primary,
          onDestinationSelected: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          destinations:
              destinations.map<NavigationDestination>((d) {
                return NavigationDestination(
                  icon: SvgPicture.asset(d.icon),
                  selectedIcon: SvgPicture.asset(d.icon, color: AppColors.primary,),
                  label: d.label,
                );
              }).toList(),
        ),
      );
  }
}