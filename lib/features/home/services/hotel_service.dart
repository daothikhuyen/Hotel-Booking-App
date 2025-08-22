import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/utils/app_exception.dart';
import 'package:hotel_booking_app/core/firestore_collections.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';

class HotelService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Hotel> hotels = [];

  /// Get list of hotels with rating >= 4.5
  Future<List<Hotel>> fetchMostPopularHotels(BuildContext context) async {
    try {
      final snapshot =
          await _firestore
              .collection(FirestoreCollections.hotels)
              .where('traffic', isGreaterThanOrEqualTo: 500)
              .get();

      return snapshot.docs.map((doc) {
        return Hotel.fromJson(doc.data(), doc.id);
      }).toList();
    } on FirebaseException catch (e) {
      throw AppException(message: 'popular hotels: ${e.message}');
    }
  }

  Future<List<Hotel>> fetchRecomendedHotels(BuildContext context) async {
    try {
      final snapshot =
          await _firestore
              .collection(FirestoreCollections.hotels)
              .where('ratting', isGreaterThanOrEqualTo: 4.5)
              .get();

      return snapshot.docs.map((doc) {
        return Hotel.fromJson(doc.data(), doc.id);
      }).toList();
    } on FirebaseException catch (e) {
      throw AppException(message: 'Recomended ${e.message}');
    }
  }

  Future<List<Hotel>> fetchBestToday(BuildContext context) async {
    try {
      final snapshot =
          await _firestore.collection(FirestoreCollections.hotels).get();

      hotels =
          snapshot.docs.map((doc) {
            return Hotel.fromJson(doc.data(), doc.id);
          }).toList();

      final filtered =
          hotels.where((hotel) {
            return (hotel.lastPrice! - hotel.currentPrice!) > 50;
          }).toList();

      return filtered;
    } on FirebaseException catch (e) {
      throw AppException(message: 'Best hotel ${e.message}');
    }
  }
}
