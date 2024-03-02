import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/src/shared/constants.dart';
import 'package:market_list/src/shared/services/bottom_navbar.service.dart';

import '../../../../shared/widgets/mk_constrained_width.widget.dart';
import '../../navigation.module.dart';
import '../../../../shared/utils/spacing.dart';
import '../../widgets/navigation_bar.widget.dart';

class Navbar extends StatelessWidget {
  final void Function(int index) onTap;

  const Navbar({
    super.key,
    required this.onTap,
  });

  bool _active(int index) => BottomNavBar.index == index;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      color: context.isDarkMode ? ColorsPallet.black0 : ColorsPallet.light0,
      child: SafeArea(
        child: SizedBox(
          width: context.width,
          child: FNConstrainedWidth(
            maxWidth: ConstrainedMaxWidth.custom(context.isLandscape ? 590 : double.infinity),
            minPadding: const EdgeInsets.symmetric(horizontal: Spacing.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigationBarWidget.square(
                  onTap: () => onTap(NavigationIndex.menu),
                  active: _active(NavigationIndex.menu),
                  icon: Icons.menu,
                  label: 'Menu',
                ),
                NavigationBarWidget(
                  onTap: () => onTap(NavigationIndex.home),
                  active: _active(NavigationIndex.home),
                  icon: Icons.home_filled,
                  label: 'Home',
                ),
                NavigationBarWidget(
                  onTap: () => onTap(NavigationIndex.more),
                  active: _active(NavigationIndex.more),
                  icon: Icons.add,
                  label: 'Mais',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
