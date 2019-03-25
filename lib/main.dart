import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/indicator/ball_grid_pulse_indicator.dart';
import 'package:loading/indicator/line_scale_indicator.dart';
import 'package:loading/indicator/ball_scale_multiple_indicator.dart';
import 'package:loading/indicator/line_scale_party_indicator.dart';
import 'package:loading/indicator/ball_beat_indicator.dart';
import 'package:loading/indicator/line_scale_pulse_out_indicator.dart';
import 'package:loading/indicator/pacman_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        // brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.lightBlue[600],
      ),
      home: ShowLoading(),
    );
  }
}

class ShowLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Loading View'),
      ),
      body: Center(
          child: RaisedButton(
              child: const Text('Show Time'),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new LoadingList()),
                );
              })),
    );
  }
}
//LoadingIndicatorView
//(
//indicator: BallPulseIndicator
//(
//),)
//,

class LoadingList extends StatelessWidget {
  final indicatorList = [
    BallPulseIndicator(),
    BallBeatIndicator(),
    BallGridPulseIndicator(),
//    PacmanIndicator(),
    BallScaleIndicator(),
    BallScaleMultipleIndicator(),
    LineScaleIndicator(),
    LineScalePartyIndicator(),
    LineScalePulseOutIndicator(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Loading View List"),
      ),
      body: Container(
        color: Colors.lightBlue,
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this would produce 2 rows.
          padding: EdgeInsets.all(16.0),
          crossAxisSpacing: 36,
          crossAxisCount: 2,
          // Generate 100 Widgets that display their index in the List
          children: List.generate(indicatorList.length, (index) {
            return Center(
              child: Loading(indicator: indicatorList[index]),
            );
          }),
        ),
      ),
    );
  }
}
