part of 'main.dart';

class FNBottomSheet extends StatelessWidget {
  final Widget? title;
  final Widget? body;
  final Widget Function(ScrollController)? builder;
  final Widget? footer;
  final List<Widget>? actions;
  final FNBottomSheetSize size;
  final bool expandSize;
  final EdgeInsets? padding;
  final EdgeInsets? minPadding;

  const FNBottomSheet({
    this.title,
    this.body,
    this.builder,
    this.footer,
    this.actions,
    this.size = FNBottomSheetSize.md,
    this.expandSize = false,
    this.padding,
    this.minPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      key: key,
      initialChildSize: size.value,
      maxChildSize: expandSize && size != FNBottomSheetSize.full ? 0.9 : size.value,
      expand: false,
      builder: (_, scrollController) {
        return Stack(
          children: [
            ExcludeSemantics(
              child: InkWell(
                onTap: Get.back,
                enableFeedback: false,
                splashFactory: NoSplash.splashFactory,
                child: const SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              padding: padding ?? const EdgeInsets.only(bottom: Spacing.lg),
              decoration: BoxDecoration(
                color: context.isDarkMode ? ColorsPallet.black500 : ColorsPallet.light0,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(size != FNBottomSheetSize.full ? 16 : 0),
                ),
              ),
              child: FNConstrainedWidth.large(
                minPadding: minPadding,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    size != FNBottomSheetSize.full ? const FNBottomSheetHeader() : const SizedBox(height: 40),
                    if (title != null) title!,
                    SizedBox(height: Sizing.sm),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: builder != null ? builder!(scrollController) : body,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: footer ?? const SizedBox(),
                    ),
                    if (actions != null)
                      context.isLandscape
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (actions!.length == 1) const Expanded(child: SizedBox()),
                                ...List.generate(actions!.length, (index) {
                                  return Expanded(
                                      flex: 2,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: index > 0 ? Spacing.xs : 0,
                                            right: index != actions!.length - 1 ? Spacing.xs : 0),
                                        child: actions![index],
                                      ));
                                }),
                                if (actions!.length == 1) const Expanded(child: SizedBox()),
                              ],
                            )
                          : Column(
                              children: actions!,
                            ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
