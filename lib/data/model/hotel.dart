class Hotel {

  Hotel({
    required this.id,
    required this.image,
    required this.name,
    required this.location,
    required this.roomType,
    required this.categoryId,
    this.currentPrice,
    this.lastPrice,
    this.ratting,
    this.traffic,
    this.bed,
    this.bathroom,
  });

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
      image: json['image']?? '',
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      roomType: json['roomType']?? '',
      categoryId: json['categoryId'] ?? '',
      currentPrice: parseDouble(json['currentPrice']),
      lastPrice: parseDouble(json['lastPrice']),
      ratting: parseDouble(json['ratting']),
      traffic: (json['traffic'] as int?) ?? 0,
      bed: (json['bed'] as int?) ?? 0,
      bathroom: (json['bathroom'] as int?) ?? 0,
    );
  }
  String id;
  String image;
  String name;
  String location;
  String roomType;
  String categoryId;
  double? currentPrice;
  double? lastPrice;
  double? ratting;
  int? traffic;
  int? bed;
  int? bathroom;

  double? parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'location': location,
      'roomType': roomType,
      'categoryId': categoryId,
      'currentPrice': currentPrice,
      'lastPrice': lastPrice,
      'ratting': ratting,
      'traffic': traffic,
    };
  }

}
