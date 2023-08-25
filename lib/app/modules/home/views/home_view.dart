import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/app/modules/home/controllers/home_controller.dart';
import 'package:recipe_app/app/modules/home/widgets/recipe_card.dart';
import '../../../data/models/recipe_model.dart';
import '../../details/views/details_view.dart';
import '../widgets/custom_drawer.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final homeController = Get.find<HomeController>();

  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: searchAppBar(),
      drawer: const CustomDrawer(),
        body: RefreshIndicator(
        onRefresh: () async{
          if(_searchTEController.text.isNotEmpty) {
            homeController.getRecipes(_searchTEController.text);
          }
        },
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GetBuilder<HomeController>(builder: (controller){
                if (controller.recipeList.isEmpty) {
                  return const CircularProgressIndicator();
                } else {
                  return GridView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: screenWidth<700 ? 2 : screenWidth<900 ? 3 : 4,
                          childAspectRatio: 0.85
                      ),
                      itemCount: controller.recipeList.length,
                      itemBuilder: (context, index) {
                        Recipe recipe = controller.recipeList[index];
                        return InkWell(
                            onTap: () {
                              Get.to(()=>
                                const DetailsView(),
                                transition: Transition.downToUp,
                                arguments: recipe
                              );
                            },
                            child: RecipeCard(
                              recipe: recipe,
                            )
                        );
                      }
                  );
                }
              })
            )
        ),
      ),
    );
  }

  AppBar searchAppBar() {
    return AppBar(
      toolbarHeight: 86,
      title: Padding(
        padding: const EdgeInsets.only(top: 28.0, bottom: 4.0),
        child: TextFormField(
          controller: _searchTEController,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: 'Search for Recipe',
            suffixIcon: IconButton(
              onPressed: () {
                _searchTEController.clear();
              },
              icon: const Icon(Icons.cancel),
              splashRadius: 1,
            ),
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          onEditingComplete: () {
            Get.focusScope?.unfocus();
            homeController.getRecipes(_searchTEController.text);
          },
          // onChanged: (t) {
          //   homeController.getRecipes(_searchTEController.text);
          // },
          validator: (String? value) {
            if(value?.isEmpty ?? true) {
              return 'Search field is empty';
            }
            return null;
          },
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
            icon: const Icon(Icons.more_vert),
          ),
        ),
      ],
    );
  }
}


