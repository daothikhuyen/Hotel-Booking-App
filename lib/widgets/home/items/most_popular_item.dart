import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/themes/theme.dart';

class MostPopularItem extends StatefulWidget {
  const MostPopularItem({
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
  State<MostPopularItem> createState() => _MostPopularItemState();
}

class _MostPopularItemState extends State<MostPopularItem> {
@override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            width: 156,
            height: 220,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(widget.linkImage ?? 'assets/images/home/FrameOne.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          Positioned(
            top: 10,
            right: 18,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                'assets/images/icon/Heart.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: CustomerTextStyles.suitableBoldTextStyle(Colors.white)
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.address,
                    style: CustomerTextStyles.smallTextStyle(Colors.white.withOpacity(0.7))
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${widget.money}/${AppLocalizations.of(context)!.night}',
                        style: CustomerTextStyles.prNormalTextStyle(Colors.white),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/icon/solar_star-bold.svg', width: 12, height: 12, fit: BoxFit.contain,),
                          SizedBox(width: 3,),
                          Text(
                            widget.ratting,
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}