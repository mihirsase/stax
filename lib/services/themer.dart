import 'package:flutter/material.dart';
import 'package:stax/services/palette.dart';

class Themer {
  static final Themer instance = Themer._();

  Themer._();

  GlobalKey<NavigatorState> navigatorKey;

  BuildContext get context {
    if (navigatorKey == null) {
      return null;
    } else {
      return navigatorKey.currentContext;
    }
  }

  Palette get palette {
    return Palette.instance;
  }

  double get height {
    return MediaQuery.of(context).size.height;
  }

  double get width {
    return MediaQuery.of(context).size.width;
  }

  double get stepHeight0 {
    return 0.0;
  }

  double get stepHeight1 {
    return 0.1;
  }

  double get stepHeight2 {
    return 0.6;
  }

  double get stepHeight3 {
    return 0.7;
  }

  double get stepHeight4 {
    return 0.8;
  }

  double get stepHeight5 {
    return 0.9;
  }

  double get padding {
    return 4.0;
  }

  double get padding1 {
    return 12.0;
  }

  double get padding2 {
    return 26.0;
  }

  double get margin1 {
    return 12.0;
  }

  double get font1 {
    return 12.0;
  }

  double get font2 {
    return 14.0;
  }

  double get font3 {
    return 16.0;
  }

  double get font4 {
    return 18.0;
  }

  double get font5 {
    return 22.0;
  }

  double get font6 {
    return 24.0;
  }

  double get font7 {
    return 20.0;
  }

  double get radius {
    return 15.0;
  }

  double get radius1 {
    return 18.0;
  }

  double get radius2 {
    return 20.0;
  }

  double get radius3 {
    return 24.0;
  }
}
