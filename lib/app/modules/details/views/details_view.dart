import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:recipe_app/app/data/utils/colors.dart';
import 'package:recipe_app/app/modules/details/components/recipe_digest.dart';
import 'package:recipe_app/app/modules/details/controllers/details_controller.dart';
import 'package:recipe_app/app/modules/home/controllers/home_controller.dart';
import 'package:recipe_app/app/modules/home/views/home_view.dart';
import 'package:recipe_app/app/modules/home/widgets/custom_drawer.dart';
import '../../../data/models/recipe_model.dart';
import '../components/cuisine_type.dart';
import '../components/health_labels.dart';
import '../components/nutrition.dart';
import '../components/preparation.dart';
import '../components/recipe_brief_row.dart';
import '../components/recipe_ingredients.dart';
import '../components/recipe_tags.dart';


class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final detailsController = Get.find<DetailsController>();
  final TextEditingController _searchTEController = TextEditingController();

  RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    final Recipe selectedRecipe = Get.arguments;
    detailsController.recipeDetails(selectedRecipe);

    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey.shade100,
        ),
        Positioned(
            top: -75,
            right: -155,
            child: Transform.rotate(
              angle: -15,
              child: Container(
                height: 400,
                width: 325,
                decoration: BoxDecoration(
                  color: mainColor.shade200,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(600),
                  ),
                ),
              ),
            )
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: searchAppBar(),
          drawer: const CustomDrawer(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
              child: Obx(() {
                Recipe recipe = detailsController.recipeInfo.value;
                double sizedBoxHeight = 18.0;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RecipeBriefRow(recipe: recipe),
                    SizedBox(height: sizedBoxHeight,),
                    HealthLabels(recipe: recipe),
                    SizedBox(height: sizedBoxHeight,),
                    CuisineType(recipe: recipe),
                    SizedBox(height: sizedBoxHeight,),
                    RecipeIngredients(recipe: recipe),
                    SizedBox(height: sizedBoxHeight,),
                    Preparation(recipe: recipe),
                    SizedBox(height: sizedBoxHeight,),
                    Nutrition(recipe: recipe),
                    SizedBox(height: sizedBoxHeight,),
                    Visibility(
                      visible: recipe.dietLabels!.isNotEmpty,
                      replacement: const SizedBox(),
                      child: RecipeTags(recipe: recipe),
                    ),
                    SizedBox(height: sizedBoxHeight,),
                    RecipeDigest(recipe: recipe),
                  ],
                );
              })
            ),
          )
        ),
      ],
    );
  }

  final BorderRadius _borderRadius = const BorderRadius.all(Radius.circular(10.0));
  AppBar searchAppBar() {
    return AppBar(
      toolbarHeight: 110,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 28.0, bottom: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [BoxShadow(
                  offset: const Offset(2.2, 2.2),
                  blurRadius: 2.0,
                  spreadRadius: 0.5,
                  color: Colors.grey.withOpacity(0.75))]
              ),
              child: TextFormField(
                controller: _searchTEController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(IconlyLight.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchTEController.clear();
                    },
                    icon: const Icon(Icons.cancel),
                    splashRadius: 1,
                  ),
                  border: OutlineInputBorder(borderRadius: _borderRadius),
                  focusedBorder: OutlineInputBorder(borderRadius: _borderRadius),
                  focusedErrorBorder: OutlineInputBorder(borderRadius: _borderRadius),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onEditingComplete: () {
                  Get.focusScope?.unfocus();
                  Get.offAll(()=>HomeView());
                  Get.find<HomeController>().getRecipes(_searchTEController.text);
                },
                validator: (String? value) {
                  if(value?.isEmpty ?? true) {
                    return 'Search field is empty';
                  }
                  return null;
                },
              ),
            ),
            FittedBox(
              child: RichText(
                text: TextSpan(
                  text: 'Refine search by '.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: const [
                    TextSpan(text: 'Calories, Diet, Ingredients', style: TextStyle(fontWeight: FontWeight.bold)),
                    WidgetSpan(child: Icon(IconlyLight.arrowDown2, size: 22, color: Colors.black,))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      leading: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.only(top: 28.0, bottom: 4.0),
          child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 28.0, bottom: 4.0),
          child: IconButton(
            onPressed: () {
              _searchTEController.clear();
            },
            icon: const Icon(Icons.more_vert, color: Colors.black,),
          ),
        ),
      ],
    );
  }
}

