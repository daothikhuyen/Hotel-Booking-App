import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/model/destination.dart';
import 'package:hotel_booking_app/routes/destinations.dart';
import 'package:hotel_booking_app/theme/app_colors.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children:
              destinations.map<Widget>((Destination destination) {
                return DestinationView(destination);
              }).toList(),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, -2), // location y
            ),
          ],
        ),

        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((
              states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(color: AppColors.primary);
              }
              return const TextStyle(color: AppColors.textColor);
            }),
          ),
          child: NavigationBar(
            elevation: 0,
            selectedIndex: _selectedIndex,
            backgroundColor: Colors.white,
            indicatorColor: Colors.transparent,
            onDestinationSelected: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            destinations:
                destinations.map<NavigationDestination>((d) {
                  return NavigationDestination(
                    icon: SvgPicture.asset(d.icon),
                    // ignore: deprecated_member_use
                    selectedIcon: SvgPicture.asset(
                      d.icon,
                      // ignore: deprecated_member_use
                      color: AppColors.primary,
                    ),
                    label: d.label,
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}
