import 'package:flutter/material.dart';

class Destination {
  const Destination( this.id,this.icon, this.label);
  final int id;
  final String icon;
  final String label;

}

const List<Destination> destinations = <Destination>[
  Destination(0,'assets/images/icon/home.svg', 'Home'),
  Destination(1,'assets/images/icon/Document.svg', 'My Booking'),
  Destination(2,'assets/images/icon/Stroke-4.svg', 'Message'),
  Destination(3,'assets/images/icon/Profile.svg', 'Profile'),
];