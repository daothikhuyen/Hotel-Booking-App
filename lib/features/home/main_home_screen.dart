import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/utils/translation_helper.dart';
import 'package:hotel_booking_app/data/model/destination.dart';
import 'package:hotel_booking_app/features/home/controller/hotel_controller.dart';
import 'package:hotel_booking_app/features/home/controller/navigation_controller.dart';
import 'package:hotel_booking_app/routes/destinations.dart';
import 'package:provider/provider.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;
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
  Widget build(BuildContext context) {
    final _ = Provider.of<HotelController>(context, listen: false);

    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: IndexedStack(
        index: _selectedIndex,
        children:
            listDestination.map<Widget>((Destination destination) {
              return DestinationView(_selectedIndex);
            }).toList(),
      ),
      bottomNavigationBar:
          listDestination.length < 2
              ? const SizedBox.shrink()
              : Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  border: Border(
                    top: BorderSide(
                      color: context.colorScheme.outline,
                      width: 0.5,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: context.colorScheme.onSurface.withValues(
                        alpha: 0.1,
                      ),
                      blurRadius: 8,
                      offset: const Offset(0, -2), // location y
                    ),
                  ],
                ),

                child: NavigationBarTheme(
                  data: NavigationBarThemeData(
                    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>(
                      (states) {
                        if (states.contains(WidgetState.selected)) {
                          return TextStyle(color: context.colorScheme.primary);
                        }
                        return TextStyle(
                          color: context.colorScheme.onSurfaceVariant,
                        );
                      },
                    ),
                  ),
                  child: NavigationBar(
                    elevation: 0,
                    selectedIndex: _selectedIndex,
                    backgroundColor: context.colorScheme.surface,
                    indicatorColor: Colors.transparent,
                    onDestinationSelected: (value) {
                      setState(() {
                        _selectedIndex = value;
                      });
                    },
                    destinations:
                        listDestination.map<NavigationDestination>((d) {
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
                        }).toList(),
                  ),
                ),
              ),
    );
  }
}
