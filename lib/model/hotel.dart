
class Hotel {
  String id;
  String image;
  String name;
  String location;
  double? current_price;
  double? last_price;
  double? ratting;
  int? traffic;

  Hotel({
    required this.id,
    required this.image,
    required this.name,
    required this.location,
    required this.current_price,
    required this.last_price,
    this.ratting,
    this.traffic,
  });

  factory Hotel.fromJson(Map<String, dynamic> json,String id) {

    double? parseDouble(dynamic value) {
      if (value == null) return null;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value);
      return null;
    }

    return Hotel(
      id: id,
      image: json['image'] ,
      name: json['name'],
      location: json['location'] ,
      current_price: parseDouble(json['current_price']),
      last_price: parseDouble(json['last_price']),
      ratting: parseDouble(json['ratting']),
      traffic: (json['traffic'] as int?) ?? 0,
    );
  }
  
  double? parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}
