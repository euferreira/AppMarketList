import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/src/shared/constants.dart';

import '../../../shared/utils/spacing.dart';
import 'navigation_bar_content.widget.dart';

enum NavigationType {
  normal,
  square,
}

class NavigationBarWidget extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final bool active;
  final String label;
  final NavigationType type;

  const NavigationBarWidget({
    super.key,
    this.type = NavigationType.normal,
    required this.label,
    required this.icon,
    required this.active,
    required this.onTap,
  });

  const NavigationBarWidget.square({
    super.key,
    required this.label,
    required this.icon,
    required this.active,
    required this.onTap,
  }) : type = NavigationType.square;

  @override
  Widget build(BuildContext context) {
    final isPhoneLandscape = context.isLandscape && context.isTablet;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
        child: type == NavigationType.normal
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: isPhoneLandscape ? 50 : 30,
                    height: 2,
                    child: active
                        ? const DecoratedBox(
                            decoration: BoxDecoration(
                              color: ColorsPallet.blue500,
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                          )
                        : null,
                  ),
                  NavigationBarContent(
                    label: label,
                    icon: icon,
                    active: active,
                    isPhoneLandscape: isPhoneLandscape,
                  ),
                ],
              )
            : Container(
                decoration: BoxDecoration(
                  color: context.isDarkMode ? ColorsPallet.blue400 : ColorsPallet.blue500,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: NavigationBarContent(
                  label: label,
                  icon: icon,
                  active: active,
                  iconColor: ColorsPallet.light0,
                  textColor: ColorsPallet.light0,
                  isPhoneLandscape: isPhoneLandscape,
                ),
              ),
      ),
    );
  }
}
