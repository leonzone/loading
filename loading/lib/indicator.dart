import 'package:flutter/widgets.dart';
import 'package:loading/loading.dart';

abstract class Indicator {
  late LoadingState context;
  late List<AnimationController> animationControllers;

  paint(Canvas canvas, Paint paint, Size size);

  List<AnimationController> animation();

  void postInvalidate() {
    // ignore: invalid_use_of_protected_member
    context.setState(() {});
  }

  void start() {
    animationControllers = animation();

    startAnims(animationControllers);
  }

  void dispose() {
    for (var i = 0; i < animationControllers.length; i++) {
      animationControllers[i].dispose();
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
