import 'package:flutter/material.dart';

const MaterialColor mainColor = MaterialColor(_mainColorPrimaryValue, <int, Color>{
  50: Color(0xFFF0FDE1),
  100: Color(0xFFD8FAB3),
  200: Color(0xFFBFF781),
  300: Color(0xFFA5F44F),
  400: Color(0xFF91F129),
  500: Color(_mainColorPrimaryValue),
  600: Color(0xFF76ED03),
  700: Color(0xFF6BEB02),
  800: Color(0xFF61E802),
  900: Color(0xFF4EE401),
});
 const int _mainColorPrimaryValue = 0xFF7EEF03;

const MaterialColor mainColorAccent = MaterialColor(_mainColorAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_mainColorAccentValue),
  400: Color(0xFFBEFFA5),
  700: Color(0xFFABFF8B),
});
const int _mainColorAccentValue = 0xFFE3FFD8;