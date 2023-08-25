import 'package:flutter/material.dart';
import 'package:recipe_app/app/data/models/recipe_model.dart';
import '../../../data/utils/colors.dart';
import 'custom_network_image.dart';

class RecipeCard extends StatelessWidget {

  // final String image, title, subTitle, calText, ingrText;
  final Recipe recipe;

  const RecipeCard({
    required this.recipe,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderRadius = 6.0;

    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: mainColor.shade400,
          width: 1
        ),
        borderRadius: BorderRadius.circular(borderRadius)
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  CustomNetworkImage(
                      imgUrl: '${recipe.image}'
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('${recipe.label}',
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('${recipe.source}',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 16
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Center(
                          child: FittedBox(
                              child: Text(
                                '${recipe.calories.toString().split('.').first} CAL'
                              )))),

                      const VerticalDivider(thickness: 1, color: Colors.grey),

                      Expanded(
                        child: Center(
                            child: FittedBox(
                              child: Text(
                                  '${recipe.ingredients!.length} INGR')))),
                    ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}