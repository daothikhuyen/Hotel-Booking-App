import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/core/firestore_collections.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';

class HotelService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Hotel> hotels = [];
  DocumentSnapshot? _lastDoc;

  /// Get list of hotels with rating >= 4.5
  Future<List<Hotel>> fetchMostPopularHotels(
    BuildContext context, {
    required int limit,
    bool loadMore = false,
  }) async {
    try {
      var query = _firestore
          .collection(FirestoreCollections.hotels)
          .where('traffic', isGreaterThanOrEqualTo: 500)
          .limit(limit);

      if (loadMore && _lastDoc != null) {
        query = query.startAfterDocument(_lastDoc!);
      }

      final snapshot = await query.get();

      if (snapshot.docs.isNotEmpty) {
        _lastDoc = snapshot.docs.last;
      }

      return snapshot.docs.map((doc) {
        return Hotel.fromJson(doc.data(), doc.id);
      }).toList();
    } on FirebaseException catch (e) {
      throw AppException(message: 'popular hotels: ${e.message}');
    }
  }

  Future<List<Hotel>> fetchRecomendedHotels(
    BuildContext context, {
    required int limit,
    bool loadMore = false,
  }) async {
    try {
      var query = _firestore
          .collection(FirestoreCollections.hotels)
          .where('ratting', isGreaterThanOrEqualTo: 4.5)
          .limit(limit);

      if (loadMore && _lastDoc != null) {
        query = query.startAfterDocument(_lastDoc!);
      }

      final snapshot = await query.get();

      if (snapshot.docs.isNotEmpty) {
        _lastDoc = snapshot.docs.last;
      }

      return snapshot.docs.map((doc) {
        return Hotel.fromJson(doc.data(), doc.id);
      }).toList();
    } on FirebaseException catch (e) {
      throw AppException(message: 'Recomended ${e.message}');
    }
  }

  Future<List<Hotel>> fetchBestToday(
    BuildContext context, {
    required int limit,
    bool loadMore = false,
  }) async {
    try {
      Query<Map<String, dynamic>> query = _firestore.collection(
        FirestoreCollections.hotels,
      );

      if (loadMore && _lastDoc != null) {
        query = query.startAfterDocument(_lastDoc!);
      }

      final snapshot = await query.get();

      if (snapshot.docs.isNotEmpty) {
        _lastDoc = snapshot.docs.last;
      }

      final hotels =
          snapshot.docs.map((doc) {
            return Hotel.fromJson(doc.data(), doc.id);
          }).toList();

      // Lọc best today
      final filtered =
          hotels.where((hotel) {
            return ((hotel.lastPrice ?? 0) - (hotel.currentPrice ?? 0)) > 50;
          }).toList();

      return filtered.take(limit).toList();
    } on FirebaseException catch (e) {
      throw AppException(message: 'Best hotel ${e.message}');
    }
  }

  Future<List<Hotel>> fetchAll(
    BuildContext context, {
    required int limit,
    bool loadMore = false,
  }) async {
    try {
      var query = _firestore
          .collection(FirestoreCollections.hotels)
          .limit(limit);

      if (loadMore && _lastDoc != null) {
        query = query.startAfterDocument(_lastDoc!);
      }

      final snapshot = await query.get();

      if (snapshot.docs.isNotEmpty) {
        _lastDoc = snapshot.docs.last;
      }

      return snapshot.docs.map((doc) {
        return Hotel.fromJson(doc.data(), doc.id);
      }).toList();
    } on FirebaseException catch (e) {
      throw AppException(message: 'all ${e.message}');
    }
  }

  Future<List<Hotel>> searchHotel(String text, int limit) async {
    try {
      final snapshot =
          await _firestore
              .collection(FirestoreCollections.hotels)
              .orderBy('name')
              .startAt([text])
              .endAt(['$text\uf8ff'])
              .limit(limit)
              .get();

      return snapshot.docs.map((doc) {
        return Hotel.fromJson(doc.data(), doc.id);
      }).toList();
    } on FirebaseException catch (e) {
      throw AppException(message: 'search ${e.message}');
    }
  }

  Future<List<Hotel>> filterHotel(
    String location,
    double price,
    int bed,
    int bathroom,
    int rating,
  ) async {
    try {
      var query = _firestore.collection(FirestoreCollections.hotels).limit(10);

      if (location.isNotEmpty) {
        query = query.where('location', isEqualTo: location);
      }
      if (price > 0) {
        final priceFormat = (price * 1000).round();
        query = query.where('currentPrice', isLessThanOrEqualTo: priceFormat);
      }
      if (bed > 0) {
        query = query.where('bed', isEqualTo: bed);
      }
      if (bathroom > 0) {
        query = query.where('bathroom', isEqualTo: bathroom);
      }
      if (rating > 0) {
        final lowerBound = rating.floorToDouble();
        query = query.where('ratting', isLessThanOrEqualTo: lowerBound);
      }

      final snapshot = await query.get();

      return snapshot.docs.map((doc) {
        return Hotel.fromJson(doc.data(), doc.id);
      }).toList();
    } on FirebaseException catch (e) {
      throw AppException(message: 'search ${e.message}');
    }
  }

  Future<List<Hotel>> fetchHotelByCategory(
    BuildContext context,
    String categoryId,
    int limit,
  ) async {
    try {
      final snapshot =
          await _firestore
              .collection(FirestoreCollections.hotels)
              .where('categoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      if (snapshot.docs.isEmpty) {
        return await fetchRecomendedHotels(context, limit: limit);
      }

      return snapshot.docs.map((doc) {
        return Hotel.fromJson(doc.data(), doc.id);
      }).toList();
    } on FirebaseException catch (e) {
      throw AppException(message: 'fetch hotel by category ${e.message}');
    }
  }
}
