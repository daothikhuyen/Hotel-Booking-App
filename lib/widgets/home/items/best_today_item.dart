import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/themes/theme.dart';

class BestTodayItem extends StatelessWidget {
  const BestTodayItem({
    super.key,
    this.linkImage,
    required this.name,
    required this.address,
    required this.money,
    required this.ratting,
  });

  final String? linkImage;
  final String name;
  final String address;
  final double money;
  final String ratting;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101,
      width: 296,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            margin: const EdgeInsets.only(right: 8, left: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              image: DecorationImage(
                image: AssetImage(linkImage!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                name,
                style: CustomerTextStyles.avBoldTextStyle(Colors.black),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/icon/location.svg',
                    // ignore: deprecated_member_use
                    color: Color(0xFF66707A),
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 4),
                  Text(
                    address,
                    style: CustomerTextStyles.suitableBoldTextStyle(
                      Color(0xFF66707A),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/icon/solar_star-bold.svg',
                    width: 16,
                    height: 16,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 4),
                  Text(
                    ratting,
                    style: GoogleFonts.inter(
                      textStyle: CustomerTextStyles.prBoldTextStyle(
                        Color(0xFFe4b706),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '(453)',
                    style: CustomerTextStyles.prNormalTextStyle(Color(0xFF9CA4AB)),
                  ),

                  SizedBox(width: 15),
                  Text(
                    '\$$money',
                    style: GoogleFonts.inter(
                      textStyle: CustomerTextStyles.suitableBoldTextStyle(
                        Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    '\$$money',
                    style: GoogleFonts.inter().copyWith(
                      fontSize: 12,
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough, 
                      decorationColor: Colors.red, 
                      decorationThickness: 1, 
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
