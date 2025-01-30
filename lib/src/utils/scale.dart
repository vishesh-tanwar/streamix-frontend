import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/src/utils/keys.dart';

class Scale {
  Scale._();
  static final Scale _instance = Scale._();
  factory Scale() => _instance;

  late double _scale;
  late MediaQueryData _media;
 
  static void initialize() {
    final Scale scale = Scale();
    scale._media = MediaQuery.of(Keys.navigatorKey.currentContext!);
    if (kIsWeb) {
      scale._scale = scale._media.size.width / scale._media.size.height;
    } else {
      scale._scale = scale._media.size.height / scale._media.size.width;
    }
  }

  static double get screenHeight => Scale()._media.size.height;
  static double get screenWidth => Scale()._media.size.width;
}

extension ScaleFactor on num {
  double get toScale {
    if (kIsWeb) {
      return this * Scale()._scale * 0.5;
    } else {
      return this * Scale()._scale * 0.45;
    }
  }
}