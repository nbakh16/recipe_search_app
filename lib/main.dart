import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:recipe_app/app/data/utils/app_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Recipe App",
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightThemeData(),
      themeMode: ThemeMode.light,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

