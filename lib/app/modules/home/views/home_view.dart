import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/app/modules/home/controllers/home_controller.dart';
import 'package:recipe_app/app/modules/home/widgets/recipe_card.dart';
import '../../../data/models/recipe_model.dart';
import '../../details/views/details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    final homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: searchAppBar(),
      drawer: const Drawer(),
      body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FutureBuilder<List<Recipe>>(
                future: homeController.recipes,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    final List<Recipe> recipes = snapshot.data!;
                    return GridView.builder(
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: screenWidth<700 ? 2 : screenWidth<900 ? 3 : 4,
                            childAspectRatio: 0.85
                        ),
                        itemCount: recipes.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Get.to(()=> const DetailsView());
                              },
                              child: RecipeCard(
                                image: '${recipes[index].image}',
                                title: '${recipes[index].label}',
                                subTitle: '${recipes[index].source}',
                                calText: recipes[index].calories.toString().split('.').first,
                                ingrText: '${recipes[index].ingredients?.length}',
                              )
                          );
                        }
                    );
                  }
                },
              )
            ),
          )
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

