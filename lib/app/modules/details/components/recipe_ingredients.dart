import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import '../../../data/models/ingredients_model.dart';
import '../../../data/models/recipe_model.dart';
import '../../home/widgets/custom_network_image.dart';
import '../widgets/ingredients_card.dart';

class RecipeIngredients extends StatelessWidget {
  const RecipeIngredients({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ingredients',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(
          height: screenWidth<700 ? screenWidth*0.33 : screenWidth*0.20,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: recipe.ingredients?.length,
              itemBuilder: (context, index) {
                Ingredients ingredient = recipe.ingredients![index];
                return IngredientsCard(
                    onTap: () {
                      showGeneralDialog(
                        barrierDismissible: true,
                        barrierLabel: '',
                        context: context,
                        pageBuilder: (_, __, ___) {
                          return Container();
                        },
                        transitionBuilder: (_, anim, __, ___) {
                          return Transform.scale(
                              scale: Curves.easeInOut.transform(anim.value),
                              child: Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                            onPressed: ()=> Get.back(),
                                            icon: const Icon(IconlyBold.closeSquare, color: Colors.redAccent)
                                        ),
                                      ),
                                      SizedBox(
                                          height: 100, width: 100,
                                          child: CustomNetworkImage(imgUrl: '${ingredient.image}')),
                                      const SizedBox(height: 5.0,),
                                      Text('${ingredient.text}',
                                        style: Theme.of(context).textTheme.titleMedium,
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 10.0,),
                                      Text('Weight: ${ingredient.weight?.toStringAsFixed(2)} g',
                                        style: Theme.of(context).textTheme.titleSmall,
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text('Category: ${ingredient.foodCategory}',
                                        style: Theme.of(context).textTheme.titleSmall,
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          );
                        },
                        transitionDuration: const Duration(milliseconds: 300),
                      );
                    },
                    ingredients: ingredient
                );
              }
          ),
        )
      ],
    );
  }
}