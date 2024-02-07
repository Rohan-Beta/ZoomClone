import 'dart:math';

import 'package:flutter/material.dart';

class MyScreenSize {
  Size getScreenSize() {
    // ignore: deprecated_member_use
    return MediaQueryData.fromView(WidgetsBinding.instance.window).size;
  }

  String getUid() {
    return (100000 + Random().nextInt(10000)).toString();
  }
}
