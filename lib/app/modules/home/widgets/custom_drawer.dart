import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

import '../../../data/utils/colors.dart';
import '../../details/widgets/recipe_list_tile.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List recipeList = [
      'Chicken',
      'Beef',
      'Fish',
      'Noodles',
      'Pasta',
      'Curry',
      'Chinese',
      'Soup',
      'Burger',
      'Sandwich'
    ];

    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: false,
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: mainColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(radius: 30,
                        child: Icon(IconlyLight.user2),
                      ),
                      SizedBox(height: 5.0,),
                      Text('User Name'),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text('Home'),
                  leading: const Icon(IconlyLight.home),
                  onTap: () {
                    Get.back();
                  },
                ),
                ExpansionTile(
                  title: const Text('Browse Recipe'),
                  leading: const Icon(IconlyLight.category),
                  children: <RecipeListTile>[
                    for(String item in recipeList)
                      RecipeListTile(title: item,)
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('About'),
            leading: const Icon(IconlyLight.dangerCircle),
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
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Developer\nNabil Akhunjee\nnbkah16@gmail.com',
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16.0,),
                                const Text(
                                  'Assessment for\nBattery Low Interactive Ltd',
                                  textAlign: TextAlign.center,
                                ),
                                ElevatedButton(
                                    onPressed: () => Get.back(),
                                    child: Text('Okay',
                                      style: Theme.of(context).textTheme.headlineMedium,
                                    ))
                              ],
                            )
                        ),
                      )
                  );
                },
                transitionDuration: const Duration(milliseconds: 300),
              );
            },
          ),
        ],
      ),
    );
  }
}