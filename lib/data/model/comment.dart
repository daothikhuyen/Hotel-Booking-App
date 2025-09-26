class Comment {

  Comment({
    required this.idUser,
    required this.idHotel,
    required this.content,
    required this.rating,
  });
  factory Comment.fromJson(Map<String, dynamic> json) {
    double? parseDouble(dynamic value) {
      if (value == null) return null;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value);
      return null;
    }

    return Comment(
      idUser: json['idUser'],
      idHotel: json['idHotel'],
      content: json['content'],
      rating: parseDouble(json['rating']),
    );
  }
  final String idUser;
  final String idHotel;
  final String content;
  final double? rating;
}
