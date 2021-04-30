import 'package:flutter/material.dart';
import 'package:loading/indicator.dart';

class BallGridPulseIndicator extends Indicator {
  var scaleDoubles = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0];
  var alphaInts = [255, 255, 255, 255, 255, 255, 255, 255, 255];

  @override
  paint(Canvas canvas, Paint? paint, Size size) {
    var circleSpacing = 4;
    var width = size.width;
    var radius = (width - circleSpacing * 4) / 6;
    var x = width / 2 - (radius * 2 + circleSpacing);
    var y = width / 2 - (radius * 2 + circleSpacing);
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        canvas.save();
        var translateX = x + (radius * 2) * j + circleSpacing * j;
        var translateY = y + (radius * 2) * i + circleSpacing * i;
        canvas.translate(translateX, translateY);
        paint!.color = paint.color.withAlpha(alphaInts[3 * i + j]);
        canvas.drawCircle(
            Offset(0, 0), radius * scaleDoubles[3 * i + j], paint);
        canvas.restore();
      }
    }
  }

  @override
  List<AnimationController> animation() {
    var durations = [720, 1020, 1280, 1420, 1450, 1180, 870, 1450, 1060];

    List<AnimationController> controllers = [];
    for (int i = 0; i < 9; i++) {
      var sizeController = new AnimationController(
          duration: Duration(milliseconds: durations[i]), vsync: context);
      var alphaTween =
          new IntTween(begin: 122, end: 255).animate(sizeController);
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
  startAnims(List<AnimationController> controllers) {
    var delays = [-60, 250, -170, 480, 310, 30, 460, 780, 450];
    for (var i = 0; i < controllers.length; i++) {
      Future.delayed(Duration(milliseconds: delays[i]), () {
        if (context.mounted) controllers[i].repeat(reverse: true);
      });
    }
  }
}
