import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../constants.dart';

class BaseShimmerWidget extends StatelessWidget {
  final Widget child;
  static final Color bgColor = Get.isDarkMode ? ColorsPallet.black400 : Colors.white;

  const BaseShimmerWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.isDarkMode ? ColorsPallet.black200 : Colors.grey.shade200,
      highlightColor: context.isDarkMode ? ColorsPallet.black600 : Colors.grey.shade100,
      child: child,
    );
  }
}
