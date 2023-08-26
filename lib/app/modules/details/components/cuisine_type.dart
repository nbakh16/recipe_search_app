import 'package:flutter/material.dart';

import '../../../data/models/recipe_model.dart';
import '../widgets/custom_chip.dart';

class CuisineType extends StatelessWidget {
  const CuisineType({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Cuisine Type:',
            style: Theme.of(context).textTheme.titleLarge
        ),
        Wrap(
          children: <Widget>[
            for(var item in recipe.cuisineType!)
              CustomChip(text: item)
          ],
        )
      ],
    );
  }
}