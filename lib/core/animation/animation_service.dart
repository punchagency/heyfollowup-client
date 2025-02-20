import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class AnimationService {
  Animation<double> createFadeAnimation(AnimationController controller);
  Animation<double> createZoomAnimation(AnimationController controller);
  Animation<Offset> createSlideAnimation(AnimationController controller, double dx, double dy);
}

@LazySingleton(as: AnimationService)
class AnimationServiceImpl implements AnimationService {

  @override
  Animation<double> createZoomAnimation(AnimationController controller) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  Animation<Offset> createSlideAnimation(AnimationController controller, double dx, double dy) {
    return Tween<Offset>(begin: Offset(dx, dy), end: Offset.zero).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  Animation<double> createFadeAnimation(AnimationController controller) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      ),
    );
  }
}
