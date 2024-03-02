part of 'main.dart';

enum FNBottomSheetSize {
  sm,
  md,
  lg,
  xl,
  full;

  double get value {
    final pixelRatio = Get.pixelRatio.clamp(1, 3);
    final resize = (1 / pixelRatio - 1 / 3).clamp(0, 1);

    switch (this) {
      case FNBottomSheetSize.sm:
        return 0.3 + 0.6 * resize;
      case FNBottomSheetSize.md:
        return 0.5 + 0.4 * resize;
      case FNBottomSheetSize.lg:
        return 0.7 + 0.2 * resize;
      case FNBottomSheetSize.xl:
        return 0.9;
      case FNBottomSheetSize.full:
        return 1;
    }
  }
}

FNBottomSheetSize sizeBottomSheet(int value, {forceFull = false}) {
  if (forceFull) {
    return FNBottomSheetSize.full;
  }
  switch (value) {
    case 1:
      return FNBottomSheetSize.lg;
    default:
      return FNBottomSheetSize.xl;
  }
}

FNBottomSheetSize sizeBottomSheetUser(int value) {
  switch (value) {
    case 1:
      return FNBottomSheetSize.md;
    case 2:
    case 3:
      return FNBottomSheetSize.lg;
    default:
      return FNBottomSheetSize.xl;
  }
}
