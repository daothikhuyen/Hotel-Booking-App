import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/data/data/comment_user.dart';
import 'package:hotel_booking_app/features/hotel_detail/section/read_more.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({required this.comment, super.key});

  final CommentWithUser comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${comment.user.displayName}',
              style: HBTextStyles.bodySemiboldSmall(
                context.colorScheme.inverseSurface,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  Assets.images.icon.solarStarBold,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '${comment.comment.rating}',
                  style: HBTextStyles.bodySemiboldXSmall(
                    context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 5),
          child: ReadMore(text: comment.comment.content),
        ),
      ],
    );
  }
}
