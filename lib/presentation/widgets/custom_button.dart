import 'package:flutter/cupertino.dart';
import 'package:flutter_recruitment_task/presentation/theme/app_dimens.dart';
import 'package:flutter_recruitment_task/presentation/theme/app_typography.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const CustomButton({this.onTap, required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: onTap,
      child: Text(
        text,
        style: AppTypography.buttons,
      ),
      borderRadius: BorderRadius.circular(AppDimens.m),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.xxl,
        vertical: AppDimens.m,
      ),
    );
  }
}
