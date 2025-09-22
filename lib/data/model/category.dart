class Category {

  Category({
    required this.uid,
    required this.title,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json, String uid) {
    return Category(
      uid: uid,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
    );
  }

  final String uid;
  final String title;
  final String image;
  
}
