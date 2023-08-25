import 'package:get/get.dart';

import '../../../data/models/recipe_model.dart';

class DetailsController extends GetxController {
  final Rx<Recipe> recipeInfo = Rx<Recipe>(Recipe());

  void recipeDetails(Recipe recipe) => recipeInfo.value = recipe;

  @override
  void onClose() {}
}
