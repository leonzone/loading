# Loading

A flutter widget of loading progress Indicator. Easy to use, easy to extend

![art](https://wx3.sinaimg.cn/mw690/7699d26bgy1g3nxfi6q1fg20h20zqn8k.gif)

## Installation

Add dependency to pubspec.yaml

```
dependencies:
  ...
  loading: ^1.0.1
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

