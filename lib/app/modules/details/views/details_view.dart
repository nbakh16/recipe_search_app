import 'package:flutter/material.dart';
import 'package:recipe_app/app/data/utils/colors.dart';

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
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text('Wok-Fried Duck & Oyster Sauce',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            Text('See full recipe on:',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text('BBC GOOD FOOD',
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
                  )
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

