import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme{
  ThemeData lightThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: mainColor,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade100,
        elevation: 2,
        iconTheme: const IconThemeData(
            color: Colors.grey,
            size: 28
        ),
        actionsIconTheme: const IconThemeData(
            color: Colors.grey,
            size: 28
        ),
      ),
      textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.25, 1.25),
                blurRadius: 3.0,
                color: Colors.black,
              ),
            ],
          ),
          titleMedium: TextStyle(
              fontWeight: FontWeight.bold
          ),
          titleLarge: TextStyle(
              color: Colors.grey,
              fontSize: 18
          )
      ),
      inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey, width: 0.5
              ),
              borderRadius: BorderRadius.all(Radius.circular(100.0))
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey, width: 1.25
              ),
              borderRadius: BorderRadius.all(Radius.circular(100.0))
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.red, width: 1
              ),
              borderRadius: BorderRadius.all(Radius.circular(100.0))
          ),
          contentPadding: EdgeInsets.only(left: 14.0, right: 6.0),
          suffixIconColor: Colors.grey
      ),
    );
  }
}