// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:hotel_booking_app/themes/theme.dart';

class CardMostPopular extends StatefulWidget {
  const CardMostPopular({
    Key? key,
    this.linkImage,
    required this.name,
    required this.address,
    required this.money, required this.ratting,
  }) : super(key: key);

  final String? linkImage;
  final String name;
  final String address;
  final double money;
  final String ratting;

  @override
  State<CardMostPopular> createState() => _CardMostPopularState();
}

class _CardMostPopularState extends State<CardMostPopular> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            width: 156,
            height: 220,
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(widget.linkImage ?? 'assets/images/home/FrameOne.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          Positioned(
            top: 15,
            right: 10,
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
                        '\$ ${widget.money}/night',
                        style: CustomerTextStyles.prNormalTextStyle(Colors.white),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 12),
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
