part of 'main.dart';

class FNBottomSheetHeader extends StatelessWidget {
  const FNBottomSheetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Sizing.md),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 38,
            height: 4,
            decoration: BoxDecoration(
              color: context.isDarkMode ? ColorsPallet.grey700 : ColorsPallet.light400,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        SizedBox(height: Sizing.lg),
      ],
    );
  }
}
