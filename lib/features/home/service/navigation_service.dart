
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hotel_booking_app/data/model/destination.dart';

class NavigationService {

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Destination> destinations = [];

  Future<List<Destination>> fetchDestination() async {
    try {
      final snapshot =
          await _firestore
              .collection('destination')
              .get();

      destinations =
          snapshot.docs.map((doc) {
            return Destination.fromJson(doc.data(), doc.id);
          }).toList();

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return destinations;
  }
}