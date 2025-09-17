import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/core/firestore_collections.dart';
import 'package:hotel_booking_app/data/data/comment_user.dart';
import 'package:hotel_booking_app/data/model/comment.dart';
import 'package:hotel_booking_app/data/model/user.dart';

class HotelDetailService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentSnapshot? _lastDoc;

  Future<List<CommentWithUser>> fetchCommentHotels(
    BuildContext context, {
    required int limit,
    required String idHotel,
    bool loadMore = false,
  }) async {
    try {
      var query = _firestore
          .collection(FirestoreCollections.comment)
          .where('idHotel', isEqualTo: idHotel)
          .limit(limit);

      if (loadMore && _lastDoc != null) {
        query = query.startAfterDocument(_lastDoc!);
      }

      final snapshot = await query.get();

      if (snapshot.docs.isEmpty) return [];

      _lastDoc = snapshot.docs.last;

      final listComment = <CommentWithUser>[];
      for (final doc in snapshot.docs) {
        final comment = Comment.fromJson(doc.data());
        final userDoc =
            await _firestore
                .collection(FirestoreCollections.users)
                .doc(comment.idUser)
                .get();

        if (!userDoc.exists) continue;
        final user = HBUser.fromJson(userDoc.data() ?? {});
        listComment.add(CommentWithUser(comment: comment, user: user));
      }
      return listComment;
    } on FirebaseException catch (e) {
      throw AppException(message: 'comment: ${e.message}');
    }
  }
}
