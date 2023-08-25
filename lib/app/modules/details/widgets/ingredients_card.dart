import 'package:flutter/material.dart';
import '../../../data/models/ingredients_model.dart';
import '../../../data/utils/colors.dart';

class IngredientsCard extends StatelessWidget {
  const IngredientsCard({super.key, required this.ingredients, this.onTap});

  final Ingredients ingredients;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        color: mainColor,
        child: Center(
          child: InkWell(
            onTap: onTap,
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text('${ingredients.text}',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 18
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16)
                          ),
                          color: mainColor.shade200
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text('${ingredients.foodCategory}',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: 15,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
