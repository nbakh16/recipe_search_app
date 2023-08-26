import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import '../../../data/models/recipe_model.dart';
import '../../home/widgets/custom_network_image.dart';
import '../../web_view/views/web_view_view.dart';
import '../widgets/squared_button.dart';

class RecipeBriefRow extends StatelessWidget {
  const RecipeBriefRow({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('${recipe.label}',
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text('See full recipe on:',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(()=> const WebViewView(),
                      transition: Transition.downToUp,
                      arguments: recipe.url
                  );
                },
                child: FittedBox(
                  child: Text('${recipe.source}'.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        decoration: TextDecoration.underline,
                        fontSize: 16
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  SquareButton(
                    onTap: () {

                    },
                    icon: const Icon(IconlyLight.plus),
                  ),
                  SquareButton(
                    onTap: () {
                      Get.to(()=> const WebViewView(),
                          arguments: recipe.shareAs
                      );
                    },
                    icon: const Icon(IconlyBold.send),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: CustomNetworkImage(
                    imgUrl: '${recipe.image}'),
              ),
            ),
          ),
        )
      ],
    );
  }
}