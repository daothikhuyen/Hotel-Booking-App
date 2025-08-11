import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

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
                  'assets/images/avatar/Ellipse.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Matr Kohler',
                  style: GoogleFonts.plusJakartaSans().copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/icon/Vector.svg',
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'San Diego, CA',
                      style: GoogleFonts.plusJakartaSans().copyWith(
                        color: Color(0xFF78828A),
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
