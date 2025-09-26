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
    this.rating,
    this.traffic,
    this.bed,
    this.bathroom,
  });

  String id;
  String image;
  String name;
  String location;
  String roomType;
  String categoryId;
  double? currentPrice;
  double? lastPrice;
  double? rating;
  int? traffic;
  int? bed;
  int? bathroom;

}
