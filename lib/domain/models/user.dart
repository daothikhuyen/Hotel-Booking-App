class HBUser {
  HBUser({
    required this.uid,
    required this.email,
    this.displayName,
    this.numberPhone,
    this.location,
    this.photoURL,
  });

  String uid;
  String email;
  String? displayName;
  String? numberPhone;
  String? location;
  String? photoURL;
}
