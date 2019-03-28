## Loading_demo

A flutter widget of loading progress Indicator. Easy to use, easy to extend

<img src="http://media.xindapei.cn/2019-03-28%2017.09.10.gif" width=250 height=480/>

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

## Thanks

[AVLoadingIndicatorView](https://github.com/81813780/AVLoadingIndicatorView)
