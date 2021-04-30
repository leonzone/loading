import 'package:flutter/material.dart';
import 'package:loading/indicator.dart';

class BallBeatIndicator extends Indicator {
  //scale x ,y
  var scaleDoubles = [0.3, 0.3, 0.3];
  var delays = [350, 0, 350];

  @override
  paint(Canvas canvas, Paint? paint, Size size) {
    var circleSpacing = 4;
    var width = size.width;
    var height = size.height;
    var radius = width / 6;
    var x = width / 2 - (radius * 2 + circleSpacing);
    var y = height / 2;
    for (int i = 0; i < 3; i++) {
      canvas.save();
      var translateX = x + (radius * 2) * i + circleSpacing * i;
      canvas.translate(translateX, y);
      canvas.scale(scaleDoubles[i], scaleDoubles[i]);
      canvas.drawCircle(Offset(0, 0), radius, paint!);
      canvas.restore();
    }
  }

  @override
  List<AnimationController> animation() {
    List<AnimationController> controllers = [];

    for (var i = 0; i < 3; i++) {
      AnimationController sizeController = new AnimationController(
          duration: const Duration(milliseconds: 375), vsync: context);
      var delayedAnimation =
          Tween(begin: 0.3, end: 1.0).animate(sizeController);
      delayedAnimation.addListener(() {
        scaleDoubles[i] = delayedAnimation.value;
        postInvalidate();
      });
      // size.
      controllers.add(sizeController);
    }
    return controllers;
  }

  @override
  void startAnim(AnimationController controller) {
    controller.repeat(reverse: true);
  }

  @override
  startAnims(List<AnimationController> controllers) {
    for (var i = 0; i < controllers.length; i++) {
      Future.delayed(Duration(milliseconds: delays[i]), () {
        if (context.mounted) startAnim(controllers[i]);
      });
    }
  }
}
