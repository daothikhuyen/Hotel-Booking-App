import 'package:flutter/material.dart';

class TextStylePreview {
  final String name;
  final String description;
  final TextStyle Function(Color color) style;

  TextStylePreview(this.name, this.description, this.style);
}
