import 'package:flutter/material.dart';

class AppSpacing {
  const AppSpacing({this.base = 4});
  final double base;

  // Named sizes
  double get xs => base;
  double get sm => base * 2;
  double get md => base * 3;
  double get lg => base * 4;
  double get xl => base * 6;
  double get xxl => base * 8;
  double get huge => base * 12;

  // Common EdgeInsets presets
  EdgeInsets get allXs => EdgeInsets.all(xs);
  EdgeInsets get allSm => EdgeInsets.all(sm);
  EdgeInsets get allMd => EdgeInsets.all(md);
  EdgeInsets get allLg => EdgeInsets.all(lg);

  EdgeInsets get horizSm => EdgeInsets.symmetric(horizontal: sm);
  EdgeInsets get horizMd => EdgeInsets.symmetric(horizontal: md);
  EdgeInsets get horizlg => EdgeInsets.symmetric(horizontal: lg);
  EdgeInsets get horizXL => EdgeInsets.symmetric(horizontal: xl);
  EdgeInsets get vertSm => EdgeInsets.symmetric(vertical: sm);
  EdgeInsets get vertMd => EdgeInsets.symmetric(vertical: md);

  SizedBox get gapXs => SizedBox(width: xs, height: xs);
  SizedBox get gapSm => SizedBox(width: sm, height: sm);
  SizedBox get gapMd => SizedBox(width: md, height: md);
  SizedBox get gapLg => SizedBox(width: lg, height: lg);
}

class AppHeights {
  const AppHeights({this.toolbar = 75, this.expandedAppBar = 75});
  final double toolbar;
  final double expandedAppBar;
}
