import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:recipe_app/app/modules/details/controllers/details_controller.dart';
import 'package:get/get.dart';
import '../../../data/models/digest_model.dart';
import '../../../data/models/recipe_model.dart';
import '../../../data/utils/colors.dart';

class RecipeDigest extends StatelessWidget {
  const RecipeDigest({super.key, required this.recipe,});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    RxInt selectedIndex = 0.obs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Digest',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Stack(
          children: [
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 4,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Icon(IconlyLight.arrowRight2, size: 25, color: Colors.black87),
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(
                right: 18.0, top: 10.0, bottom: 10.0,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 4,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: RawScrollbar(
                thickness: 1.5,
                thumbColor: Colors.black87,
                // thumbVisibility: true,
                trackVisibility: true,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recipe.digest!.length,
                  itemBuilder: (context, index) {
                    return Obx(()=> AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: selectedIndex.value == index ? mainColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: selectedIndex.value == index ? Colors.grey : Colors.transparent,
                              blurRadius: 4,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: InkWell(
                              onTap: () {
                                selectedIndex.value = index;
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${recipe.digest?[index].label}',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: selectedIndex.value == index ? Colors.black87 : Colors.black45
                                  ),
                                ),
                              )),
                        )
                    ));
                  },
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 220,
          width: double.infinity,
          padding: const EdgeInsets.all(18.0),
          decoration: const BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              )
          ),
          child: Obx(()=> Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: RichText(
                  text: TextSpan(
                    text: '${digestInfo(selectedIndex.value).label}',
                    style: Theme.of(context).textTheme.headlineMedium,
                    children: const [
                      WidgetSpan(child: Icon(IconlyLight.arrowDown2, size: 25,))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8.0,),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Total: ${digestInfo(selectedIndex.value).total?.toStringAsFixed(2)} '
                        '${digestInfo(selectedIndex.value).unit}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18
                      ),
                    ),
                    Text('Daily: ${digestInfo(selectedIndex.value).daily?.toStringAsFixed(2)} '
                        '${digestInfo(selectedIndex.value).unit}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0,),
              Expanded(
                flex: 3,
                child: Visibility(
                  visible: digestInfo(selectedIndex.value).sub != null,
                  replacement: const SizedBox(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: mainColor.shade200,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        )
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                                flex: 2,
                                child: SizedBox()
                            ),
                            Expanded(
                              flex: 1,
                              child: Text('Total',
                                  style: Theme.of(context).textTheme.labelMedium
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text('Daily',
                                  style: Theme.of(context).textTheme.labelMedium
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0,),
                        Expanded(
                          child: RawScrollbar(
                            thumbColor: Colors.black54,
                            thumbVisibility: true,
                            thickness: 3.0,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: digestInfo(selectedIndex.value).sub?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text('${digestInfo(selectedIndex.value).sub?[index].label}',
                                          style: Theme.of(context).textTheme.titleSmall,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text('${digestInfo(selectedIndex.value).sub?[index].total?.toStringAsFixed(2)} '
                                            '${digestInfo(selectedIndex.value).unit}',
                                          style: Theme.of(context).textTheme.titleSmall,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text('${digestInfo(selectedIndex.value).sub?[index].daily?.toStringAsFixed(2)} '
                                            '${digestInfo(selectedIndex.value).unit}',
                                          style: Theme.of(context).textTheme.titleSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }, scrollDirection: Axis.vertical,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
        )
      ],
    );
  }

  Digest digestInfo(int index) {
    final recipe = Get.find<DetailsController>().recipeInfo.value;
    Digest digest = recipe.digest![index];

    return digest;
  }

}
