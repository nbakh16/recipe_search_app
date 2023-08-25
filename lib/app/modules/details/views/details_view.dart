import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:recipe_app/app/data/utils/colors.dart';
import 'package:recipe_app/app/modules/details/controllers/details_controller.dart';
import 'package:recipe_app/app/modules/details/widgets/custom_chip.dart';
import 'package:recipe_app/app/modules/details/widgets/ingredients_card.dart';

import '../../../data/models/ingredients_model.dart';
import '../../../data/models/recipe_model.dart';
import '../../home/widgets/custom_network_image.dart';
import '../../web_view/views/web_view_view.dart';
import '../widgets/heading_text.dart';
import '../widgets/squared_button.dart';


class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final detailsController = Get.find<DetailsController>();
  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    final Recipe selectedRecipe = Get.arguments;
    detailsController.recipeDetails(selectedRecipe);

    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
        ),
        Positioned(
            top: -75,
            right: -155,
            child: Transform.rotate(
              angle: -15,
              child: Container(
                height: 400,
                width: 325,
                decoration: const BoxDecoration(
                  color: mainColorAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(600),
                  ),
                ),
              ),
            )
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: searchAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
              child: Obx(() {
                final recipe = detailsController.recipeInfo.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                          child: SizedBox(
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: CustomNetworkImage(
                                  imgUrl: '${recipe.image}'),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
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
                    ),
                    Column(
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
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeadingText(title: 'Ingredients'),
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
                                                  Text('Weight: ${ingredient.weight}g',
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
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeadingText(title: 'Preparation'),
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
                                children: const [
                                  TextSpan(text: 'BBC Food', style: TextStyle(fontWeight: FontWeight.bold)),
                                  WidgetSpan(child: Icon(IconlyLight.arrowDown2, size: 20,))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeadingText(title: 'Nutrition'),
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
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const HeadingText(title: 'Tags'),
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
                    ),
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

