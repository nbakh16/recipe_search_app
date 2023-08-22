import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: SearchAppBar(),
      drawer: Drawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth<700 ? 2 : screenWidth<900 ? 3 : 4,
                  childAspectRatio: 0.65
              ),
              itemCount: 16,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {

                  },
                  child: Card(

                  ),
                );
              }
            ),
          ),
        )
      ),
    );
  }
}

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  SearchAppBar({super.key});
  final double appBarHeight = 86;

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: appBarHeight,
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
