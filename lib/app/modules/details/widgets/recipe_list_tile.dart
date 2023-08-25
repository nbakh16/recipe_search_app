import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/app/modules/home/views/home_view.dart';
import '../../home/controllers/home_controller.dart';

class RecipeListTile extends StatelessWidget {
  const RecipeListTile({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Get.find<HomeController>().getRecipes(title);
        Get.back();
        if(Get.currentRoute != '/HomeView') {
          Get.offAll(()=> HomeView());
        }
      },
    );
  }
}