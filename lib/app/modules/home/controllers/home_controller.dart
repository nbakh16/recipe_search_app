import 'dart:convert';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';
import 'package:recipe_app/api_key.dart';
import '../../../data/models/recipe_model.dart';


class HomeController extends GetxController {
  List<Recipe> recipeList = <Recipe>[];

  String initialRecipe = 'chicken';

  Future<void> getRecipes(String recipe) async {
    recipeList.clear();
    update();

    // String recipeUrl = 'https://edamam-recipe-search.p.rapidapi.com/search?q=$recipe'; //v1 url
    String recipeUrl = 'https://edamam-recipe-search.p.rapidapi.com/api/recipes/v2?type=any&q=$recipe';

    Response response = await get(
      Uri.parse(recipeUrl),
      headers: {
        'X-RapidAPI-Key': ApiKey().apiKey,
        'X-RapidAPI-Host': 'edamam-recipe-search.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);

      recipeList = decodedResponse['hits']
          .map<Recipe>((key) => Recipe.fromJson(key['recipe']))
          .toList();
      update();

    } else {
      print('Error: ${response.statusCode}');
    }
  }

  @override
  void onInit() {
    super.onInit();
    getRecipes(initialRecipe);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
