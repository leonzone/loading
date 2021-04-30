import 'package:flutter/material.dart';
import 'package:loading/indicator.dart';

class LineScalePartyIndicator extends Indicator {
  var scaleDoubles = [1.0, 1.0, 1.0, 1.0];
  var durations = [630, 215, 505, 365];

  @override
  paint(Canvas canvas, Paint? paint, Size size) {
    var translateX = size.width / 9;
    var translateY = size.height / 2;

    for (int i = 0; i < 4; i++) {
      canvas.save();
      canvas.translate((2 + i * 2) * translateX - translateX / 2, translateY);
      canvas.scale(scaleDoubles[i], scaleDoubles[i]);
      var rectF = RRect.fromLTRBR(-translateX / 2, -size.height / 2.5,
          translateX / 2, size.height / 2.5, Radius.circular(5));
      canvas.drawRRect(rectF, paint!);
      canvas.restore();
    }
  }

  @override
  List<AnimationController> animation() {
    List<AnimationController> controllers = [];
    for (int i = 0; i < 4; i++) {
      var sizeController = new AnimationController(
          duration: Duration(milliseconds: durations[i]), vsync: context);
      var alphaTween = new Tween(begin: 1.0, end: 0.4).animate(sizeController);
      sizeController.addListener(() {
        scaleDoubles[i] = alphaTween.value;
        postInvalidate();
      });
      controllers.add(sizeController);
    }
    return controllers;
  }

  @override
  startAnims(List<AnimationController> controllers) {
    var delays = [770, 290, 280, 740];
    for (var i = 0; i < controllers.length; i++) {
      Future.delayed(Duration(milliseconds: delays[i]), () {
        if (context.mounted) controllers[i].repeat(reverse: true);
      });
    }
  }
}
