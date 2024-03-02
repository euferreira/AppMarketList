import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/src/shared/constants.dart';

class NavigationBarContent extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? iconColor;
  final Color? textColor;
  final bool active;
  final bool isPhoneLandscape;

  const NavigationBarContent({
    super.key,
    this.textColor,
    this.iconColor,
    required this.label,
    required this.icon,
    required this.active,
    required this.isPhoneLandscape,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 8,
        left: 8,
        top: isPhoneLandscape ? 8 : 12,
        bottom: isPhoneLandscape ? 10 : 12,
      ),
      child: Flex(
        direction: isPhoneLandscape ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Icon(
                icon,
                size: 24,
                color: iconColor ??
                    (active
                        ? context.isDarkMode
                            ? ColorsPallet.blue400
                            : ColorsPallet.blue500
                        : context.isDarkMode
                            ? ColorsPallet.grey300
                            : ColorsPallet.mid800),
              )
            ],
          ),
          const SizedBox.square(dimension: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall?.copyWith(
              fontFamily: 'Margem',
              fontWeight: active ? FontWeight.w700 : FontWeight.w400,
              color: textColor ??
                  (active
                      ? context.isDarkMode
                          ? ColorsPallet.light0
                          : ColorsPallet.dark950
                      : context.isDarkMode
                          ? ColorsPallet.grey200
                          : ColorsPallet.mid900),
            ),
          ),
        ],
      ),
    );
  }
}
