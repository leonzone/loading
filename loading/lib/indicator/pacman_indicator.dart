import 'package:flutter/material.dart';
import 'package:loading/indicator.dart';

class PacmanIndicator extends Indicator {
  var translateX = 0.0;
  var alpha = 0;
  var degrees1 = 0.0;
  var degrees2 = 0.0;

  @override
  paint(Canvas canvas, Paint? paint, Size size) {
    var x = size.width / 2;
    var y = size.height / 2;

    canvas.save();

    canvas.translate(x, y);
    canvas.rotate(degrees1);
    paint!.color = paint.color.withAlpha(255);
    Rect rectF1 = Rect.fromLTRB(-x / 1.7, -y / 1.7, x / 1.7, y / 1.7);
    canvas.drawArc(rectF1, 0, 270, false, paint);

    canvas.restore();

    canvas.save();
    canvas.translate(x, y);
    canvas.rotate(degrees2);
    paint.color = paint.color.withAlpha(255);
    Rect rectF2 = Rect.fromLTRB(-x / 1.7, -y / 1.7, x / 1.7, y / 1.7);
    canvas.drawArc(rectF2, 90, 270, false, paint);
    canvas.restore();

    var radius = size.width / 11;
    paint.color = paint.color.withAlpha(alpha);
    canvas.drawCircle(
        Offset((1 - translateX) * size.width, size.height / 2), radius, paint);
  }

  @override
  List<AnimationController> animation() {
    List<AnimationController> controllers = [];

    var controller = new AnimationController(
        duration: Duration(milliseconds: 325), vsync: context);

    var translateTween = new Tween(begin: 0, end: 0.5).animate(controller);
    var alphaTween = new IntTween(begin: 255, end: 122).animate(controller);
    var rotateTween1 = new Tween(begin: 0.0, end: 45.0).animate(controller);
    var rotateTween2 = new Tween(begin: 0.0, end: -45.0).animate(controller);

    controller.addListener(() {
      translateX = translateTween.value as double;
      alpha = alphaTween.value;
      degrees1 = rotateTween1.value;
      degrees2 = rotateTween2.value;
      postInvalidate();
    });

    controllers.add(controller);
    return controllers;
  }

  @override
  void startAnim(AnimationController controller) {
    controller.repeat(reverse: true);
  }
}
