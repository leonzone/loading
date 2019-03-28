# Loading

A flutter widget of loading progress Indicator. Easy to use, easy to extend

![art](http://media.xindapei.cn/2019-03-28%2017.09.10.gif)

## Installation

Add dependency to pubspec.yaml

```
dependencies:
  ...
  loading: ^1.0.0
```
Run in your terminal

```
flutter packages get
```



## Example

``` Dart
      body: Container(
        color: Colors.lightBlue,
        child: Center(
          child: Loading(indicator: BallPulseIndicator(), size: 100.0),
        ),
      ),
```

