import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Hotel {
  String id;
  String image;
  String name;
  String location;
  String roomType;
  double? currentPrice;
  double? lastPrice;
  double? ratting;
  int? traffic;

  Hotel({
    required this.id,
    required this.image,
    required this.name,
    required this.location,
    required this.roomType,
    this.currentPrice,
    this.lastPrice,
    this.ratting,
    this.traffic,
  });

  double? parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  factory Hotel.fromJson(Map<String, dynamic> json, String id) {
    double? parseDouble(dynamic value) {
      if (value == null) return null;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value);
      return null;
    }

    return Hotel(
      id: id,
      image: json['image'],
      name: json['name'],
      location: json['location'],
      roomType: json['roomType'],
      currentPrice: parseDouble(json['currentPrice']),
      lastPrice: parseDouble(json['lastPrice']),
      ratting: parseDouble(json['ratting']),
      traffic: (json['traffic'] as int?) ?? 0,
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'location': location,
      'roomType': roomType,
      'currentPrice': currentPrice,
      'lastPrice': lastPrice,
      'ratting': ratting,
      'traffic': traffic,
    };
  }

}
