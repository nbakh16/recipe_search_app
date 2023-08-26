import 'package:flutter/material.dart';

import '../../../data/models/recipe_model.dart';
import '../widgets/custom_chip.dart';

class HealthLabels extends StatelessWidget {
  const HealthLabels({
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
        Text('Health Labels:',
            style: Theme.of(context).textTheme.titleLarge
        ),
        Wrap(
          children: <Widget>[
            for(var item in recipe.healthLabels!)
              CustomChip(text: item)
          ],
        )
      ],
    );
  }
}