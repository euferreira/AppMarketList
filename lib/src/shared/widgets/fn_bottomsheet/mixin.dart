part of 'main.dart';

mixin GSBottomSheetMixin on StatelessWidget {
  bool get isScrollControlled => true;

  bool get isDismissible => true;

  bool get enableDrag => true;

  RxBool get acceptConstraintsLandscape => false.obs;

  Color? get backgroundColor => null;

  Future<void> beforeOpen() async {}

  Future<void> afterClose<T>([T? result]) async {}

  Future<T?> show<T>({
    bool? isScrollControlled,
    bool? enableDrag,
    bool? isDismissible,
    double? topLeftBorderRadius,
    double? topRightBorderRadius,
  }) async {
    await beforeOpen();

    final result = await Get.bottomSheet<T>(
      GestureDetector(
        onTap: Get.back,
        child: Container(
          color: Colors.transparent,
          child: Obx(
            () => FNConstrainedWidth(
              maxWidth: ConstrainedMaxWidth.custom(
                  acceptConstraintsLandscape.isTrue && Get.context?.isLandscape == true && !Platform.isAndroid
                      ? 0.7 * Get.width
                      : double.infinity),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                      color: backgroundColor ?? (Get.isDarkMode ? ColorsPallet.black500 : ColorsPallet.light0),
                      borderRadius: acceptConstraintsLandscape.isTrue || Get.context?.isLandscape == false
                          ? BorderRadius.only(
                              topLeft: Radius.circular(topLeftBorderRadius ?? 16),
                              topRight: Radius.circular(topRightBorderRadius ?? 16),
                            )
                          : null,
                    ),
                    child: this),
              ),
            ),
          ),
        ),
      ),
      isScrollControlled: isScrollControlled ?? this.isScrollControlled,
      enableDrag: enableDrag ?? this.enableDrag,
      isDismissible: isDismissible ?? this.isDismissible,
      settings: RouteSettings(
        name: '${Get.currentRoute}/bottomsheet/${toString()}',
      ),
    );

    await afterClose<T>(result);
    return result;
  }
}
