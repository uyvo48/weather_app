import 'dart:ui';

class ChartData {
  String _xvalue;
  double _yvalue;
  Color _color;

  ChartData(this._xvalue, this._yvalue, this._color);

  Color get color => _color;

  set color(Color value) {
    _color = value;
  }

  double get yvalue => _yvalue;

  set yvalue(double value) {
    _yvalue = value;
  }

  String get xvalue => _xvalue;

  set xvalue(String value) {
    _xvalue = value;
  }
}
