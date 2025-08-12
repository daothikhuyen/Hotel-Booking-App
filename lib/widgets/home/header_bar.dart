// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/themes/theme.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar( {super.key, required this.linkImage, required this.userName, required this.address});

  final String? linkImage;
  final String userName;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            ClipOval(
              child: Container(
                color: Colors.white,
                child: Image.asset(
                  linkImage?? 'assets/images/avatar/Ellipse.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userName,
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: CustomerTextStyles.avBoldTextStyle(Theme.of(context).colorScheme.onSurface)
                  )
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/icon/Vector.svg',
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 4),
                    Text(
                      address,
                      style: GoogleFonts.plusJakartaSans().copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Container(
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
            SizedBox(width: 8),
            Container(
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
                      right: 3  ,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 2.5,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    )
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
