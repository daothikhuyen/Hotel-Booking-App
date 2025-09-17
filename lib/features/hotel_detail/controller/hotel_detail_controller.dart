import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/data/data/comment_user.dart';
import 'package:hotel_booking_app/features/hotel_detail/section/hotel_detail_service.dart';

class HotelDetailController extends ChangeNotifier {
  List<CommentWithUser> listCommentHotel = [];
  bool isLoading = false;
  bool hasMore = true;
  static const int limit = 8;

  final HotelDetailService _service = HotelDetailService();

  Future<void> fetchCommentHotel(
    BuildContext context, {
    required String idHotel,
    bool loadMore = false,
    int limit = limit,
  }) async {
    try {
      final List<CommentWithUser> newComment;
      if (isLoading) return;

      if (loadMore) {
        isLoading = true;
        notifyListeners();
      }

      newComment = await _service.fetchCommentHotels(
        context,
        limit: limit,
        idHotel: idHotel,
      );

      if (newComment.length < limit) {
        hasMore = false;
      }

      if (isLoading) {
        listCommentHotel.addAll(newComment);
      } else {
        listCommentHotel = newComment;
      }

      isLoading = false;
      notifyListeners();
    } on AppException catch (e) {
      HBSnackBar().showSnackBar(context, e.message);
    }
  }
}
