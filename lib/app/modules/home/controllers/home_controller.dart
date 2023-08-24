import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/api_key.dart';
import '../../../data/models/recipe_model.dart';


class HomeController extends GetxController {
  late Future<List<Recipe>> recipes;

  Future<List<Recipe>> fetchRecipes() async {
    const String recipeUrl = 'https://edamam-recipe-search.p.rapidapi.com/search?q=chicken';

    try {
      final response = await http.get(
        Uri.parse(recipeUrl),
        headers: {
          'X-RapidAPI-Key': ApiKey().apiKey,
          'X-RapidAPI-Host': 'edamam-recipe-search.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        final List<Recipe> recipes = body['hits']
            .map<Recipe>((key) => Recipe.fromJson(key['recipe']))
            .toList();

        print('>>>> ${recipes[0].label}');
        return recipes;
      } else {
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  @override
  void onInit() {
    recipes = fetchRecipes();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
