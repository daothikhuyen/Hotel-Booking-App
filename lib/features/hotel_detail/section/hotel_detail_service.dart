import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/core/firestore_collections.dart';
import 'package:hotel_booking_app/data/data/comment_user.dart';
import 'package:hotel_booking_app/data/model/comment.dart';
import 'package:hotel_booking_app/data/model/user.dart';

class HotelDetailService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Comment> listComment = [];
  DocumentSnapshot? _lastDoc;

  Future<List<Comment>> fetchMostPopularHotels(
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

      if (snapshot.docs.isNotEmpty) {
        _lastDoc = snapshot.docs.last;
        for (var doc in snapshot.docs) {
          final comment = Comment.fromJson(doc.data());
          // listComment.add(
          //   CommentWithUser(comment: Comment.fromJson(doc.data()), user: user),
          // );
        }
      }

      return snapshot.docs.map((doc) {
        return Comment.fromJson(doc.data());
      }).toList();
    } on FirebaseException catch (e) {
      throw AppException(message: 'popular hotels: ${e.message}');
    }
  }
}
