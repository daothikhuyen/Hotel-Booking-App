class Comment {

  Comment({
    required this.idUser,
    required this.idHotel,
    required this.comment,
    required this.rating,
  });
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      idUser: json['idUser'],
      idHotel: json['idHotel'],
      comment: json['comment'],
      rating: (json['rating'] as num).toDouble(),
    );
  }
  final String idUser;
  final String idHotel;
  final String comment;
  final double rating;
}
