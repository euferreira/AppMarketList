part of 'main.dart';

class FNBottomSheetTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onTapBack;
  final TextStyle? titleStyle;

  const FNBottomSheetTitle(
    this.title, {
    this.onTapBack,
    this.titleStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Semantics(
            label: 'Voltar',
            child: IconButton(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.zero,
              onPressed: onTapBack ?? Get.back,
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: context.isDarkMode ? ColorsPallet.light0 : ColorsPallet.mid600,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: titleStyle ??
                context.textTheme.headlineLarge!.copyWith(
                  fontSize: context.textTheme.titleLarge!.fontSize,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
