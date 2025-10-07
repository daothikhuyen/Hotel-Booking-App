import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/model/comment_user.dart';
import 'package:hotel_booking_app/data/repositories/api_response.dart';
import 'package:hotel_booking_app/data/repositories/api_status.dart';
import 'package:hotel_booking_app/ui/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/ui/features/hotel_detail/widgets/section/hotel_detail_service.dart';

class HotelDetailController extends ChangeNotifier {
  List<CommentWithUser> listCommentHotel = [];
  bool isLoading = false;
  bool hasMore = true;
  static const int limit = 8;

  final HotelDetailService _service = HotelDetailService();

  Future<ApiResponse> fetchCommentHotel(
    BuildContext context, {
    required String idHotel,
    bool loadMore = false,
    int limit = limit,
  }) async {
    try {
      final List<CommentWithUser> newComment;
      if (isLoading) return ApiResponse(ApiStatus.loading);

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
      return ApiResponse(ApiStatus.success);
    } on AppException catch (e) {
      return ApiResponse(ApiStatus.error, message: e.message);
    }
  }
}
