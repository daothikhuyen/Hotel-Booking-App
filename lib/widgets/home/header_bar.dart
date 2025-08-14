// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/themes/theme.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderBar( {super.key, required this.linkImage, required this.userName, required this.address});

  final String? linkImage;
  final String userName;
  final String address;

   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Row(
          children: [
            ClipOval(
              child: Container(
                color: Colors.white,
                child: Image.asset(
                  'assets/images/avatar/Ellipse.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Matr Kohler',
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: CustomerTextStyles.avBoldTextStyle(
                      Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/icon/Vector.svg',
                      // ignore: deprecated_member_use
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'San Diego, CA',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: CustomerTextStyles.suitableTextStyle(Theme.of(context).colorScheme.onSurfaceVariant)
                      )
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          GestureDetector(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xFFDADDDD)),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/images/icon/Search.svg',
                  color: Theme.of(context).iconTheme.color,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          GestureDetector(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xFFDADDDD)),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/icon/Group.svg',
                      color: Theme.of(context).iconTheme.color,
                      fit: BoxFit.contain,
                    ),

                    Positioned(
                      top: 1.4,
                      right: 3,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 2.5,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      );
  }
}
