
class HBUser {
  
  HBUser({
    required this.uid,
    required this.email,
    this.displayName,
    this.numberPhone,
    this.location,
    this.photoURL,
  });

  factory HBUser.fromJson(Map<String, dynamic> json) {

    return HBUser(
      uid: json['uid'],
      displayName: json['displayName'],
      email: json['email'],
      numberPhone: json['numberPhone'],
      location: json['location'],
      photoURL: json['photoURL'],
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
      'numberPhone': numberPhone ?? '',
      'location': location ?? '',
      'photoURL': photoURL ?? '',
    };
  }
}
