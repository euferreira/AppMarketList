import 'package:flutter/material.dart';

class NavigationWithOffStageWidget extends StatefulWidget {
  final Widget bodyNavigation;
  final Widget minOffStageWidget;
  final Widget maxOffStageWidget;
  final bool enableOffStage;
  final bool enableMinOffStage;
  final bool enableMaxOffStage;
  final bool enableMarginBottom;

  const NavigationWithOffStageWidget({
    super.key,
    required this.bodyNavigation,
    required this.maxOffStageWidget,
    required this.minOffStageWidget,
    required this.enableMarginBottom,
    required this.enableOffStage,
    required this.enableMaxOffStage,
    required this.enableMinOffStage,
  });

  @override
  // ignore: library_private_types_in_public_api
  _NavigationWithOffStageWidgetState createState() => _NavigationWithOffStageWidgetState();
}

class _NavigationWithOffStageWidgetState extends State<NavigationWithOffStageWidget> {
  bool changeSelected = false;
  bool enableMargin = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      widget.bodyNavigation,
      Offstage(
        //quando offstage é true, não mostra os Widgets child
        offstage: !widget.enableOffStage,
        child: widget.enableMinOffStage
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Column(mainAxisSize: MainAxisSize.min, children: [widget.minOffStageWidget]),
              )
            : widget.enableMaxOffStage
                ? widget.maxOffStageWidget
                : const SizedBox(),
      )
    ]);
  }
}
