import 'dart:convert';

class Booking {
  Booking({
    required this.id,
    required this.userId,
    required this.checkIn,
    required this.checkOut,
    required this.guests,
    required this.roomType,
    required this.price,
    required this.adminFee,
    required this.totalPrice,
  });
  
  String id;
  String userId;
  DateTime checkIn;
  DateTime checkOut;
  int guests;
  String roomType;
  double price;
  double adminFee;
  double totalPrice;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'checkIn': checkIn.millisecondsSinceEpoch,
      'checkOut': checkOut.millisecondsSinceEpoch,
      'guests': guests,
      'roomType': roomType,
      'price': price,
      'adminFee': adminFee,
      'totalPrice': totalPrice,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'] as String,
      userId: map['userId'] as String,
      checkIn: DateTime.fromMillisecondsSinceEpoch(map['checkIn'] as int),
      checkOut: DateTime.fromMillisecondsSinceEpoch(map['checkOut'] as int),
      guests: map['guests'] as int,
      roomType: map['roomType'] as String,
      price: map['price'] as double,
      adminFee: map['adminFee'] as double,
      totalPrice: map['totalPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source) as Map<String, dynamic>);
}
