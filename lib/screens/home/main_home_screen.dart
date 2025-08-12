import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/model/destination.dart';
import 'package:hotel_booking_app/routes/destinations.dart';

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
          color: Theme.of(context).colorScheme.surface,
          border: Border(
            top: BorderSide(color: Theme.of(context).colorScheme.outline, width: 0.5),
          ),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
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
                return TextStyle(color: Theme.of(context).colorScheme.primary);
              }
              return TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant);
            }),
          ),
          child: NavigationBar(
            elevation: 0,
            selectedIndex: _selectedIndex,
            backgroundColor: Theme.of(context).colorScheme.surface,
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
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    label: () {
                      switch (d.labelKey) {
                        case 'Home':
                          return AppLocalizations.of(context)!.home;
                        case 'My Booking':
                          return AppLocalizations.of(context)!.mybooking;
                        case 'Message':
                          return AppLocalizations.of(context)!.message;
                        case 'Profile':
                          return AppLocalizations.of(context)!.profile;
                        default:
                          return '';
                      }
                    }(),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}
