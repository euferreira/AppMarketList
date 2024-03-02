part of 'main.dart';

abstract class GSBottomSheetComponent<T> extends GetView<T> with GSBottomSheetMixin {
  GSBottomSheetComponent({super.key});

  Widget? get title => null;

  Widget get body;

  Widget? get footer => null;

  List<Widget>? get buttons => null;

  RxBool get acceptFullScreen => true.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => this.acceptFullScreen.isTrue && context.isLandscape && !context.isTablet
        ? this._getFullScreenCoponent(context)
        : this._getNormalCoponent(context));
  }

  Widget _getFullScreenCoponent(BuildContext context) {
    return SafeArea(
      child: DraggableScrollableSheet(
        initialChildSize: FNBottomSheetSize.full.value,
        maxChildSize: FNBottomSheetSize.full.value,
        expand: false,
        builder: (_, scrollController) {
          return Stack(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                child: this._getBodyComponent(context),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getNormalCoponent(BuildContext context) {
    return SingleChildScrollView(
      child: this._getBodyComponent(context),
    );
  }

  Widget _getBodyComponent(BuildContext context) {
    return FNConstrainedWidth.large(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (context.isLandscape && !context.isTablet && this.acceptFullScreen.isTrue) ...[
            SizedBox(height: Sizing.lg),
          ],
          if (!(context.isLandscape && !context.isTablet && this.acceptFullScreen.isTrue)) ...[
            const FNBottomSheetHeader(),
          ],
          if (this.title != null) ...[
            this.title!,
            SizedBox(height: Sizing.lg),
          ],
          this.body,
          SizedBox(height: Sizing.lg),
          if (this.footer != null) ...[
            this.footer!,
            SizedBox(height: Sizing.md),
          ],
          if (this.buttons != null) ...[
            context.isLandscape
                ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    if (this.buttons!.length == 1) const Expanded(child: SizedBox()),
                    ...List.generate(this.buttons!.length, (index) {
                      return Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(
                                left: index > 0 ? Sizing.xs : 0,
                                right: index != this.buttons!.length - 1 ? Sizing.xs : 0),
                            child: this.buttons![index],
                          ));
                    }),
                    if (this.buttons!.length == 1) const Expanded(child: SizedBox()),
                  ])
                : Column(mainAxisSize: MainAxisSize.min, children: [
                    ...List.generate(this.buttons!.length, (index) {
                      if (index > 0) {
                        return Container(
                          margin: EdgeInsets.only(top: Sizing.sm),
                          child: this.buttons![index],
                        );
                      }
                      return this.buttons![index];
                    })
                  ]),
            SizedBox(height: Sizing.lg),
          ],
        ],
      ),
    );
  }
}
