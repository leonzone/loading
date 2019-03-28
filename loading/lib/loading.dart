import 'package:flutter/widgets.dart';
import 'package:loading/indicator.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';

class Loading extends StatefulWidget {
  Indicator indicator;
  double size;

  Loading({this.indicator,  this.size=50.0}) {
    if (indicator == null) {
      indicator = BallScaleIndicator();
    } else {
      this.indicator = indicator;
    }
  }

  @override
  State<StatefulWidget> createState() {
    return LoadingState(indicator, size);
  }
}

class LoadingState extends State<Loading> with TickerProviderStateMixin {
  Indicator indicator;
  double size;

  LoadingState(this.indicator, this.size);

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
      size: Size.square(size),
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
