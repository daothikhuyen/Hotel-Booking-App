class Hotel {
  Hotel({
    required this.id,
    required this.image,
    required this.name,
    required this.location,
    required this.currentPrice,
    required this.lastPrice,
    this.ratting,
    this.traffic,
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
      image: json['image'],
      name: json['name'],
      location: json['location'],
      currentPrice: parseDouble(json['currentPrice']),
      lastPrice: parseDouble(json['lastPrice']),
      ratting: parseDouble(json['ratting']),
      traffic: (json['traffic'] as int?) ?? 0,
    );
  }

  String id;
  String image;
  String name;
  String location;
  double? currentPrice;
  double? lastPrice;
  double? ratting;
  int? traffic;

  double? parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}
