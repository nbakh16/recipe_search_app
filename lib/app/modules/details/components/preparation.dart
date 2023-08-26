import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

import '../../../data/models/recipe_model.dart';
import '../../web_view/views/web_view_view.dart';

class Preparation extends StatelessWidget {
  const Preparation({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Preparation',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Get.to(()=> const WebViewView(),
                  transition: Transition.downToUp,
                  arguments: recipe.url
              );
            },
            child: RichText(
              text: TextSpan(
                text: 'Instructions on ',
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(text: '${recipe.source}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  const WidgetSpan(child: Icon(IconlyLight.arrowDown2, size: 20,))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}