import 'dart:ui';

abstract final class ColorsManager {
  static const Color lightPrimaryColor = Color(0xff171717);
  static const Color lightSecondaryColor = Color(0xffFFFFFF);
  static const Color greyColor = Color(0xffA0A0A0);
  
  // Dark theme colors
  static const Color darkPrimaryColor = Color(0xff121212); // Slightly lighter than pure black for depth
  static const Color darkSecondaryColor = Color(0xff1E1E1E); 
  static const Color onDarkSecondary = Color(0xffE0E0E0);
}