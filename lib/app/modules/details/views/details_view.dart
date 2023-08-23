import 'package:flutter/material.dart';
import 'package:recipe_app/app/data/utils/colors.dart';
import 'package:recipe_app/app/modules/details/widgets/ingredients_card.dart';

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
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(16.0)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(item,
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                              ),
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
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(16.0)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(item,
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                              ),
                            )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ingredients',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.black87,
                        ),
                      ),
                      Container(
                        height: 4,
                        width: MediaQuery.sizeOf(context).width * 0.25,
                        color: Colors.amberAccent,
                      ),
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
      toolbarHeight: 86,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 28.0, bottom: 4.0),
        child: Container(
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
              prefixIcon: const Icon(Icons.search),
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

