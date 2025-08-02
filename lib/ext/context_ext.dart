import 'dart:developer';

import 'package:flutter/material.dart';

extension BottomPaddingWithSafeArea on MediaQueryData {
  double get defaultBottomPaddingWithSafeArea {
    final bottomPadding = padding.bottom;
    final bottomPaddingWithSafeArea = viewInsets.bottom;

    return bottomPadding <= 16
        ? (16 + bottomPaddingWithSafeArea)
        : (bottomPadding + bottomPaddingWithSafeArea);
  }
}
