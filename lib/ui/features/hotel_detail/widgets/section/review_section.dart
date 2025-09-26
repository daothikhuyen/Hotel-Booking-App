import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/repositories/api_status.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/ui/features/hotel_detail/view_model/hotel_detail_controller.dart';
import 'package:hotel_booking_app/ui/features/hotel_detail/widgets/review_card.dart';
import 'package:provider/provider.dart';

class ReviewSection extends StatefulWidget {
  const ReviewSection({required this.number, required this.idHotel, super.key});

  final int number;
  final String idHotel;

  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  late HotelDetailController controller;
  @override
  void initState() {
    super.initState();

    controller = Provider.of<HotelDetailController>(context, listen: false)
      ..fetchCommentHotel(
        context,
        idHotel: widget.idHotel,
        limit: widget.number,
      ).then((value) {
        if (value.status == ApiStatus.error) {
          HBSnackBar().showSnackBar(context, value.message);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HotelDetailController>(context);
    return controller.listCommentHotel.isNotEmpty
        ? Column(
          children: List.generate(widget.number, (index) {
            final comment = controller.listCommentHotel[index];
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
                        image: AssetImage(Assets.images.home.frameOne.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: ReviewCard(comment: comment)),
                ],
              ),
            );
          }),
        )
        : Text(
          context.l10n.noReviews,
          style: HBTextStyles.bodyMediumSmall(
            context.colorScheme.onSurfaceVariant,
          ),
        );
  }
}
