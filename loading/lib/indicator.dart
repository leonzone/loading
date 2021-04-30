import 'package:flutter/widgets.dart';
import 'package:loading/loading.dart';

abstract class Indicator {
  late LoadingState context;
  List<AnimationController>? animationControllers;

  paint(Canvas canvas, Paint? paint, Size size);

  List<AnimationController> animation();

  void postInvalidate() {
    context.setState(() {});
  }

  void start() {
    animationControllers = animation();
    if (animationControllers != null) {
      startAnims(animationControllers!);
    }
  }

  void dispose() {
    if (animationControllers != null) {
      for (var i = 0; i < animationControllers!.length; i++) {
        animationControllers![i].dispose();
      }
    }
  }

  void startAnims(List<AnimationController> controllers) {
    for (var i = 0; i < controllers.length; i++) {
      startAnim(controllers[i]);
    }
  }

  void startAnim(AnimationController controller) {
    controller.repeat();
  }
}
