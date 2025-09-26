class Comment {
  Comment({
    required this.idUser,
    required this.idHotel,
    required this.content,
    required this.rating,
  });

  final String idUser;
  final String idHotel;
  final String content;
  final double? rating;
}
