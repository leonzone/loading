import 'package:flutter/material.dart';
import 'package:loading/indicator.dart';

class BallScaleIndicator extends Indicator {
  int mAlpha = 0;
  double mScale = 0;

  @override
  paint(Canvas canvas, Paint? paint, Size size) {
    var circleSpacing = 4;
    var width = size.width;
    var height = size.height;
    paint!.color = paint.color.withAlpha(mAlpha);
    canvas.drawCircle(Offset(width / 2, height / 2),
        (width / 2 - circleSpacing) * mScale, paint);
  }

  @override
  List<AnimationController> animation() {
    List<AnimationController> controllers = [];
    AnimationController alphaController = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: context);
    Animation<int> alpha =
        new IntTween(begin: 255, end: 0).animate(alphaController);
    alpha.addListener(() {
      mAlpha = alpha.value;
      postInvalidate();
    });
    // alpha.
    controllers.add(alphaController);

    AnimationController sizeController = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: context);
    sizeController.addListener(() {
      mScale = sizeController.value;
    });
    // alpha.
    controllers.add(sizeController);

    return controllers;
  }
}
