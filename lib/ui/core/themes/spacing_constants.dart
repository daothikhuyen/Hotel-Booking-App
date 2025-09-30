import 'package:flutter/material.dart';

class AppSpacing {
  static const double base = 4;

  // Named sizes
  static const double xs = base;
  static const double sm = base * 2;
  static const double md = base * 3;
  static const double lg = base * 4;
  static const double xl = base * 6;
  static const double xxl = base * 8;
  static const double huge = base * 12;

  // Common EdgeInsets presets (const where possible)
  static const EdgeInsets allXs = EdgeInsets.all(xs);
  static const EdgeInsets allSm = EdgeInsets.all(sm);
  static const EdgeInsets allMd = EdgeInsets.all(md);
  static const EdgeInsets allLg = EdgeInsets.all(lg);

  static const EdgeInsets horizSm = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets horizMd = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets vertSm = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets vertMd = EdgeInsets.symmetric(vertical: md);

  // Use when you need consistent gaps inside lists/rows
  static const SizedBox gapXs = SizedBox(width: xs, height: xs);
  static const SizedBox gapSm = SizedBox(width: sm, height: sm);
  static const SizedBox gapMd = SizedBox(width: md, height: md);
  static const SizedBox gapLg = SizedBox(width: lg, height: lg);
}

class AppHeights {
  static const double toolbar = 75;
  static const double expandedAppBar = 75;
}
