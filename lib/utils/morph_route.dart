import 'package:flutter/material.dart';

class MorphRoute extends PageRouteBuilder {
  final WidgetBuilder builder;

  MorphRoute({required this.builder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = 0.0;
            var end = 1.0;
            var curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var opacityAnimation = animation.drive(tween);

            var scaleAnimation = Tween(begin: 0.5, end: 1.0).animate(animation);

            return FadeTransition(
              opacity: opacityAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: child,
              ),
            );
          },
        );
}
