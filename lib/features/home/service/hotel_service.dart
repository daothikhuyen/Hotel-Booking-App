import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';

class HotelService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Hotel> hotels = [];

  /// Get list of hotels with rating >= 4.5
  Future<List<Hotel>> fetchMostPopularHotels() async {
    try {
      final snapshot =
          await _firestore
              .collection('hotels')
              .where('traffic', isGreaterThanOrEqualTo: 500)
              .get();

      hotels =
          snapshot.docs.map((doc) {
            return Hotel.fromJson(doc.data(), doc.id);
          }).toList();

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return hotels;
  }

  Future<List<Hotel>> fetchRecomendedHotels() async {
    try {
      final snapshot =
          await _firestore
              .collection('hotels')
              .where('ratting', isGreaterThanOrEqualTo: 4.5)
              .get();
      
      hotels =
          snapshot.docs.map((doc) {
            return Hotel.fromJson(doc.data(), doc.id);
          }).toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return hotels;
  }

    Future<List<Hotel>> fetchBestToday() async {
    try {
      final snapshot =
          await _firestore
              .collection('hotels')
              .get();

      hotels =
          snapshot.docs.map((doc) {
            return Hotel.fromJson(doc.data(), doc.id);
          }).toList();
      
      final filtered = hotels.where((hotel) {
        return ((hotel.last_price! - hotel.current_price!) > 50) ;
      }).toList();

      return filtered;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return hotels;
  }
}
