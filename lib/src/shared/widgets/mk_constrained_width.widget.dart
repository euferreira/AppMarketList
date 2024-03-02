import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/sizing.dart';

class FNConstrainedWidth extends StatelessWidget {
  final Widget child;
  final ConstrainedMaxWidth maxWidth;
  final EdgeInsets minPadding;

  factory FNConstrainedWidth.small({
    required Widget child,
    EdgeInsets? minPadding,
    Key? key,
  }) {
    return FNConstrainedWidth(
      maxWidth: ConstrainedMaxWidth.small(),
      minPadding: minPadding ?? EdgeInsets.symmetric(horizontal: Sizing.md),
      key: key,
      child: child,
    );
  }

  factory FNConstrainedWidth.large({
    required Widget child,
    EdgeInsets? minPadding,
    Key? key,
  }) {
    return FNConstrainedWidth(
      maxWidth: ConstrainedMaxWidth.large(),
      minPadding: minPadding ?? EdgeInsets.symmetric(horizontal: Sizing.lg),
      key: key,
      child: child,
    );
  }

  const FNConstrainedWidth({
    required this.child,
    required this.maxWidth,
    this.minPadding = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final paddingResult = EdgeInsets.only(
      top: minPadding.top,
      bottom: minPadding.bottom,
      right: calcPadding(context, maxWidth, minPadding.right),
      left: calcPadding(context, maxWidth, minPadding.left),
    );

    return Padding(
      padding: paddingResult,
      child: child,
    );
  }

  static double calcPadding(BuildContext context, ConstrainedMaxWidth maxWidth, [double minPadding = 0]) {
    final size = maxWidth.customSize ?? maxWidth.sizeOption.value(context.isTablet);
    final width = context.width;

    final padding = (width - size) / 2;
    return max(padding, minPadding);
  }

  static double calcPaddingLarge(BuildContext context) {
    return calcPadding(context, ConstrainedMaxWidth.large(), Sizing.lg);
  }
}

enum ConstrainedMaxWidthOptions {
  small,
  large,
  custom;

  int value([bool isTablet = false]) {
    switch (this) {
      case ConstrainedMaxWidthOptions.small:
        return isTablet ? 500 : 350;
      case ConstrainedMaxWidthOptions.large:
        return isTablet ? 900 : 700;
      case ConstrainedMaxWidthOptions.custom:
        return 0;
    }
  }
}

class ConstrainedMaxWidth {
  final ConstrainedMaxWidthOptions sizeOption;
  final num? customSize;

  ConstrainedMaxWidth._(this.sizeOption, [this.customSize]);

  factory ConstrainedMaxWidth.small() => ConstrainedMaxWidth._(ConstrainedMaxWidthOptions.small);

  factory ConstrainedMaxWidth.large() => ConstrainedMaxWidth._(ConstrainedMaxWidthOptions.large);

  factory ConstrainedMaxWidth.custom(num size) => ConstrainedMaxWidth._(ConstrainedMaxWidthOptions.custom, size);
}
