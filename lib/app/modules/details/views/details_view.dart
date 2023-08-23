import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:recipe_app/app/data/utils/colors.dart';
import 'package:recipe_app/app/modules/details/widgets/custom_chip.dart';
import 'package:recipe_app/app/modules/details/widgets/ingredients_card.dart';

import '../widgets/heading_text.dart';
import '../widgets/squared_button.dart';


class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List _dummyList = ['23', 'caural-hat', 'Dima'];

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
              child: Column(
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
                              child: Text('Lorem ipsum dolor sit amet, consectetur',
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text('See full recipe on:',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text('BBC good food'.toUpperCase(),
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                decoration: TextDecoration.underline
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
                                SquareButton(
                                  onTap: () {

                                  },
                                  icon: const Icon(Icons.add),
                                ),
                                SquareButton(
                                  onTap: () {

                                  },
                                  icon: const Icon(Icons.send),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(16)
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
                          for(var item in _dummyList)
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CustomChip(text: item)
                            )
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
                          for(var item in _dummyList)
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CustomChip(text: item)
                            )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeadingText(title: 'Ingredients'),
                      SizedBox(
                        height: 135,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return IngredientsCard(
                                title: '2.0 tbsp',
                                subTitle: 'Vagitable Oil'
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
                                    const CustomChip(text: '146', borderRadius: 10,),
                                    Text('Cal/Serv'.toUpperCase(),
                                      style: Theme.of(context).textTheme.titleMedium,
                                    )
                                  ],
                                ),
                                const VerticalDivider(thickness: 2, color: Colors.black38,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const CustomChip(text: '146', borderRadius: 10,),
                                    Text('Cal/Serv'.toUpperCase(),
                                      style: Theme.of(context).textTheme.titleMedium,
                                    )
                                  ],
                                ),
                                const VerticalDivider(thickness: 2, color: Colors.black38,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const CustomChip(text: '146', borderRadius: 10,),
                                    Text('Cal/Serv'.toUpperCase(),
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
                          for(var item in _dummyList)
                            Padding(
                                padding: const EdgeInsets.all(5.0),
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
              ),
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

