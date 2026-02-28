import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/resources/colors_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        color: ColorsManager.lightPrimaryColor,
        fontWeight: FontWeight.w500
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: ColorsManager.lightPrimaryColor,
      secondary: ColorsManager.lightSecondaryColor,
      onSecondary: ColorsManager.greyColor,
      onPrimaryContainer: Colors.white
    ),
    dividerTheme: DividerThemeData(
      color: Colors.white,
      thickness: 1.h,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: ColorsManager.lightPrimaryColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700
      ),
      labelMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white
      ),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        color: ColorsManager.greyColor,
        fontWeight: FontWeight.w500
      )
    )
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.darkPrimaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        color: ColorsManager.lightSecondaryColor, // White text on dark app bar
        fontWeight: FontWeight.w500
      ),
      iconTheme: const IconThemeData(
        color: ColorsManager.lightSecondaryColor
      )
    ),
    colorScheme: ColorScheme.dark(
      primary: ColorsManager.darkSecondaryColor, // Used for drawer/containers
      secondary: ColorsManager.onDarkSecondary, // Used for pills/buttons
      onSecondary: ColorsManager.greyColor,
      onPrimaryContainer: ColorsManager.darkPrimaryColor // Drawer header background
    ),
    dividerTheme: DividerThemeData(
      color: ColorsManager.lightPrimaryColor, // Dark divider line
      thickness: 1.h,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: ColorsManager.lightSecondaryColor, // White headline text
        fontSize: 24.sp,
        fontWeight: FontWeight.w700
      ),
      labelMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: ColorsManager.lightPrimaryColor // Black text on white/grey cards
      ),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        color: ColorsManager.greyColor,
        fontWeight: FontWeight.w500
      ),
      bodyMedium: TextStyle(
        color: ColorsManager.onDarkSecondary // General body text color
      )
    )
  );
}