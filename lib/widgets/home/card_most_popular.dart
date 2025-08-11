import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardMostPopular extends StatefulWidget {
  const CardMostPopular({super.key});

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
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage('assets/images/home/FrameOne.png'),
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
                    'The Horizon Retreat',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Los Angeles, CA',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$480/night',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 12),
                          Text(
                            '4.5',
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
