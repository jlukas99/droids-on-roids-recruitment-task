import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/presentation/theme/app_typography.dart';

import 'app_colors.dart';
import 'app_dimens.dart';

mixin AppTheme {
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0C0C0C),
        cardColor: const Color(0xFF292929),
        primaryColor: AppColors.primary,
        primaryColorDark: AppColors.primaryDark,
        cardTheme: CardTheme(
          color: AppColors.card,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimens.m),
            ),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData().copyWith(
          cursorColor: AppColors.accent,
          selectionColor: AppColors.accent,
          selectionHandleColor: AppColors.primaryDark,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: AppTypography.hint,
          fillColor: const Color(0xFF292929),
          filled: true,
          iconColor: AppColors.primary,
          contentPadding: const EdgeInsets.symmetric(horizontal: AppDimens.m),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.s),
            borderSide: BorderSide.none,
          ),
        ),
        textTheme: const TextTheme().apply(fontFamily: 'Poppins'),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          unselectedItemColor: AppColors.icon,
          selectedItemColor: AppColors.accent,
        ),
        hintColor: AppColors.icon,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: AppTypography.subTitle,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.accent,
        ),
        cupertinoOverrideTheme: const CupertinoThemeData().copyWith(
          primaryColor: AppColors.primary,
        ),
      );
}
