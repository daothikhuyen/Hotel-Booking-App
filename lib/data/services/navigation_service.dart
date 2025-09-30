import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/model/category.dart';
import 'package:hotel_booking_app/data/model/destination.dart';
import 'package:hotel_booking_app/ui/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/ui/core/exceptions/error_type.dart';
import 'package:hotel_booking_app/ui/core/firestore_collections.dart';
import 'package:hotel_booking_app/ui/core/network/network_util.dart';

class NavigationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Destination> destinations = [];

  Future<List<Destination>> fetchDestination(BuildContext context) async {
    await NetworkUtil.hasNetwork(context);
    try {
      final snapshot =
          await _firestore.collection(FirestoreCollections.destinations).get();

      return snapshot.docs.map((doc) {
        return Destination.fromJson(doc.data(), doc.id);
      }).toList();
    } on FirebaseException catch (e) {
      throw AppException(
        type: ErrorType.unknown,
        message: '${e.message}',
      );
    }
  }

  Future<List<Category>> fetchCategory(BuildContext context) async {
    await NetworkUtil.hasNetwork(context);
    try {
      final snapshot =
          await _firestore.collection(FirestoreCollections.category).get();

      return snapshot.docs.map((doc) {
        return Category.fromJson(doc.data(), doc.id);
      }).toList();
    } on FirebaseException catch (e) {
      throw AppException(
        type: ErrorType.unknown,
        message: '${e.message}',
      );
    }
  }
}
