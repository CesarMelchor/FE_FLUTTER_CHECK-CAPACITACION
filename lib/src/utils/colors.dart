import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFF3E5E9),
  100: Color(0xFFE2BDC8),
  200: Color(0xFFCE92A4),
  300: Color(0xFFBA6680),
  400: Color(0xFFAC4564),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF952042),
  700: Color(0xFF8B1B39),
  800: Color(0xFF811631),
  900: Color(0xFF6F0D21),
});

 const int _primaryPrimaryValue = 0xFF9D2449;

 const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFFFA2B2),
  200: Color(_primaryAccentValue),
  400: Color(0xFFFF3C5C),
  700: Color(0xFFFF2347),
});
 const int _primaryAccentValue = 0xFFFF6F87;