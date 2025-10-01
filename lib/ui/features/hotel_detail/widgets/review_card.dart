import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/data/model/comment_user.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/ui/features/hotel_detail/widgets/section/read_more.dart';

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
                SizedBox(width: context.spacing.xs),
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
          padding: EdgeInsets.only(
            right: context.spacing.sm,
            top: context.spacing.xs,
          ),
          child: ReadMore(text: comment.comment.content),
        ),
      ],
    );
  }
}
