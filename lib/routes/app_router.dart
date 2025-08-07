import 'package:flutter/material.dart';


Route animationRouter(Widget nameClass) {
   return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => nameClass,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
