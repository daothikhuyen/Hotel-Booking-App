import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/features/detail/widgets/read_more.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(number, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image:
                        const AssetImage('assets/images/home/FrameOne.png')
                            as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8,),
              Expanded(
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Kim Borrdy',
                          style: CustomTextStyles.bodySemiboldSmall(context.colorScheme.inverseSurface),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.images.icon.solarStarBold,
                              width: 16,
                              height: 16,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '4.5',
                              style: CustomTextStyles.bodySemiboldXSmall(context.colorScheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 5),
                      child: ReadMore(text: 'Amazing!  The room is good than the picture. Thanks for amazing experience!'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
