import 'package:flutter/material.dart';

import '../../../data/models/recipe_model.dart';
import '../../../data/utils/colors.dart';
import '../widgets/custom_chip.dart';

class Nutrition extends StatelessWidget {
  const Nutrition({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nutrition',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                )
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomChip(
                        text: '${recipe.totalNutrients?.eNERCKCAL?.quantity?.toStringAsFixed(2)} '
                            '${recipe.totalNutrients?.eNERCKCAL?.unit}',
                        borderRadius: 10,),
                      Text('${recipe.totalNutrients?.eNERCKCAL?.label}'.toUpperCase(),
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                  const VerticalDivider(thickness: 2, color: Colors.black38,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomChip(
                        text: '${recipe.totalNutrients?.fAT?.quantity?.toStringAsFixed(2)} '
                            '${recipe.totalNutrients?.fAT?.unit}',
                        borderRadius: 10,),
                      Text('${recipe.totalNutrients?.fAT?.label}'.toUpperCase(),
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                  const VerticalDivider(thickness: 2, color: Colors.black38,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomChip(
                        text: '${recipe.totalNutrients?.sUGAR?.quantity?.toStringAsFixed(2)} '
                            '${recipe.totalNutrients?.sUGAR?.unit}',
                        borderRadius: 10,),
                      Text('${recipe.totalNutrients?.sUGAR?.label}'.toUpperCase(),
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}