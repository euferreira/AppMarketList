import 'dart:math';

import 'package:get/get.dart';

class Sizing {
  const Sizing._();

  static const int _xs = 4;
  static const int _sm = 8;
  static const int _md = 16;
  static const int _lg = 24;
  static const int _xl = 32;
  static const int _xxl = 40;
  static const int _xxxl = 48;

  static final Map<num, double> _cache = {};
  static double? _multiplerCache;

  static const _minMultiplier = 0.7;
  static const _maxMultiplier = 1.3;
  static const _minDeviceWidth = 250;
  static const _maxDeviceWidth = 600;

  static double get _multiplier => _multiplerCache ??= _getMultiplier();

  static double _getMultiplier() {
    final deviceWidth = Get.context!.mediaQueryShortestSide;
    if (deviceWidth >= _maxDeviceWidth) return _maxMultiplier;
    if (deviceWidth < _minDeviceWidth) return _minMultiplier;

    return (_minMultiplier +
            (deviceWidth - _minDeviceWidth) / (_maxDeviceWidth - _minDeviceWidth) * (_maxMultiplier - _minMultiplier))
        .truncatePrecision();
  }

  static double _multiply(num value) => (value * _multiplier).truncatePrecision();

  static double get xs => _cache[_xs] ??= _multiply(_xs);

  static double get sm => _cache[_sm] ??= _multiply(_sm);

  static double get md => _cache[_md] ??= _multiply(_md);

  static double get lg => _cache[_lg] ??= _multiply(_lg);

  static double get xl => _cache[_xl] ??= _multiply(_xl);

  static double get xxl => _cache[_xxl] ??= _multiply(_xxl);

  static double get xxxl => _cache[_xxxl] ??= _multiply(_xxxl);

  static double custom(num value) {
    final valueToPrecision = value.truncatePrecision();
    return _cache[valueToPrecision] ??= _multiply(valueToPrecision);
  }
}

extension SizingExtension on num {
  double truncatePrecision([int precision = 2]) {
    final mod = pow(10, precision);
    return ((this * mod).floor() / mod);
  }
}
