import 'package:flutter/material.dart';
import 'package:loading/indicator.dart';

class BallScaleMultipleIndicator extends Indicator {
  var scaleDoubles = [0.0, 0.0, 0.0];
  var alphaInts = [255, 255, 255];
  var delays = [0, 200, 200];

  @override
  paint(Canvas canvas, Paint? paint, Size size) {
    var circleSpacing = 4;
    var width = size.width;
    var height = size.height;
    for (int i = 0; i < 3; i++) {
      paint!.color = paint.color.withAlpha(alphaInts[i]);
      canvas.drawCircle(Offset(width / 2, height / 2),
          (width / 2 - circleSpacing) * scaleDoubles[i], paint);
    }
  }

  @override
  List<AnimationController> animation() {
    List<AnimationController> controllers = [];
    for (int i = 0; i < 3; i++) {
      var sizeController = new AnimationController(
          duration: const Duration(milliseconds: 1000), vsync: context);
      var alphaTween = new IntTween(begin: 255, end: 0).animate(sizeController);
      sizeController.addListener(() {
        scaleDoubles[i] = sizeController.value;
        alphaInts[i] = alphaTween.value;
        postInvalidate();
      });
      controllers.add(sizeController);
    }
    return controllers;
  }

  @override
  startAnims(List<AnimationController> controllers) async {
    for (var i = 0; i < controllers.length; i++) {
      await Future.delayed(Duration(milliseconds: delays[i]), () {
        if (context.mounted) controllers[i].repeat();
      });
    }
  }
}
