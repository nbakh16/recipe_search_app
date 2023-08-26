import 'package:flutter/material.dart';

import '../../../data/models/recipe_model.dart';

class RecipeTags extends StatelessWidget {
  const RecipeTags({
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
        Text('Tags',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Wrap(
          children: <Widget>[
            for(var item in recipe.dietLabels!)
              Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('$item,',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        decoration: TextDecoration.underline,
                        fontSize: 16
                    ),
                  )
              )
          ],
        )
      ],
    );
  }
}