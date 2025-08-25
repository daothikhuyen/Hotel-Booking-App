
class HBUser {
  HBUser({
    required this.uid,
    required this.email,
    this.displayName,
    this.numberPhone,
    this.location,
    this.photoURL,
  });

  factory HBUser.fromJson(Map<String, dynamic> json, String id) {

    return HBUser(
      uid: id,
      email: json['email'],
      displayName: json['displayName'],
      numberPhone: json['numberPhone'],
      location: json['location'],
      photoURL: json['photoUrl'],
    );
  }

  String uid;
  String email;
  String? displayName;
  String? numberPhone;
  String? location;
  String? photoURL;

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'numberPhone': numberPhone ?? '0',
      'location': location ?? 'San Diego, CA',
      'photoUrl': photoURL ?? '',
    };
  }
}
