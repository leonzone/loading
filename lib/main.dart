import 'package:flutter/material.dart';
import 'package:loading/indicator.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/indicator/ball_grid_pulse_indicator.dart';
import 'package:loading/indicator/line_scale_indicator.dart';
import 'package:loading/indicator/ball_scale_multiple_indicator.dart';
import 'package:loading/indicator/line_scale_party_indicator.dart';
import 'package:loading/indicator/ball_beat_indicator.dart';
import 'package:loading/indicator/line_scale_pulse_out_indicator.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';

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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: const Text('Show Time'),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new LoadingList()),
                );
              }),
        ],
      )),
    );
  }
}

class LoadingList extends StatelessWidget {
  final Map<String, Indicator> indicatorList = {
    'BallPulseIndicator': BallPulseIndicator(),
    'BallBeatIndicator': BallBeatIndicator(),
    'BallGridPulseIndicator': BallGridPulseIndicator(),
    'BallScaleIndicator': BallScaleIndicator(),
    'BallScaleMultipleIndicator': BallScaleMultipleIndicator(),
    'BallSpinFadeLoaderIndicator': BallSpinFadeLoaderIndicator(),
    'LineScaleIndicator': LineScaleIndicator(),
    'LineScalePartyIndicator': LineScalePartyIndicator(),
    'LineScalePulseOutIndicator': LineScalePulseOutIndicator(),
  };

  Widget _buildItem(BuildContext context, int index) {
    final indicatorName = indicatorList.keys.elementAt(index);
    return ListTile(
      leading: Loading(
        indicator: indicatorList[indicatorName],
        color: Colors.lightBlue,
      ),
      title: Text(
        indicatorName,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      contentPadding: EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Loading View List"),
      ),
      body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Loading(
                        indicator: BallSpinFadeLoaderIndicator(),
                        size: 25.0,
                        color: Colors.lightBlue),
                  ),
                  hintText: 'Input sample',
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: _buildItem,
                itemCount: indicatorList.length,
              ),
            ],
          )

//        GridView.count(
//          padding: EdgeInsets.all(16.0),
//          crossAxisSpacing: 36,
//          crossAxisCount: 3,
//          // Generate 100 Widgets that display their index in the List
//          children: List.generate(indicatorList.length, (index) {
//            return Center(
//              child: Loading(indicator: indicatorList[index]),
//            );
//          }),
//        ),
          ),
    );
  }
}
