
class Destination {
  String id;
  String icon;
  String labelKey;

  Destination({
    required this.id,
    required this.icon,
    required this.labelKey,
  });

    factory Destination.fromJson(Map<String, dynamic> json,String id) {
    return Destination(
      id: id,
      icon: json['icon'] ,
      labelKey: json['labelKey'],
    );
  } 
}

// const List<Destination> destinations = <Destination>[
//   Destination(0,'assets/images/icon/home.svg', 'Home'),
//   Destination(1,'assets/images/icon/Document.svg', 'My Booking'),
//   Destination(2,'assets/images/icon/Stroke-4.svg', 'Message'),
//   Destination(3,'assets/images/icon/Profile.svg', 'Profile'),
// ];