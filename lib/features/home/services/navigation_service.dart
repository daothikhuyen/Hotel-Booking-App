import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_booking_app/core/utils/app_exception.dart';
import 'package:hotel_booking_app/core/firestore_collections.dart';
import 'package:hotel_booking_app/data/model/destination.dart';

class NavigationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Destination> destinations = [];

  Future<List<Destination>> fetchDestination() async {
    try {
      final snapshot =
          await _firestore.collection(FirestoreCollections.destinations).get();

      return snapshot.docs.map((doc) {
        return Destination.fromJson(doc.data(), doc.id);
      }).toList();
    } on FirebaseException catch (e) {
      throw AppException(message: 'navigation: ${e.message}');
    }
  }
}
