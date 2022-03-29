import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/presentation/theme/app_dimens.dart';

class AppTypography {
  static const _fontFamily = 'Poppins';

  static const TextStyle title = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: AppDimens.l,
  );

  static const TextStyle subTitle = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: AppDimens.m,
  );

  static const TextStyle paragraphs = TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppDimens.m,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle buttons = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m,
  );

  static const TextStyle hint = TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppDimens.xm,
  );

  static const TextStyle small = TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppDimens.xm,
  );
}
