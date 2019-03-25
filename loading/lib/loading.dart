import 'package:flutter/widgets.dart';
import 'package:loading/indicator.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';

class Loading extends StatefulWidget {
  Indicator indicator;

  Loading({this.indicator}) {
    if (indicator == null) {
      indicator = BallScaleIndicator();
    } else {
      this.indicator = indicator;
    }
  }

  @override
  State<StatefulWidget> createState() {
    return LoadingState(indicator);
  }
}

class LoadingState extends State<Loading> with TickerProviderStateMixin {
  Indicator indicator;

  LoadingState(this.indicator);

  @override
  void initState() {
    super.initState();
    indicator.context = this;
    indicator.start();
  }

  @override
  void dispose() {
    indicator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _Painter(indicator),
      size: Size.square(500),
    );
  }
}

class _Painter extends CustomPainter {
  Indicator indicator;

  _Painter(this.indicator);

  final defaultPaint = Paint()
    ..strokeCap = StrokeCap.butt
    ..style = PaintingStyle.fill
    ..color = Color.fromARGB(255, 255, 255, 255)
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Size size) {
    indicator.paint(canvas, defaultPaint, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
