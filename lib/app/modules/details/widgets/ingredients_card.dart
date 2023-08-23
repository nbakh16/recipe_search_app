import 'package:flutter/material.dart';
import '../../../data/utils/colors.dart';

class IngredientsCard extends StatelessWidget {
  const IngredientsCard({super.key, required this.title, required this.subTitle});

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        color: mainColor,
        child: Center(
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Center(
                    child: FittedBox(
                      child: Text(title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18
                        ),
                      ),
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16)
                        ),
                        color: mainColor.shade200
                    ),
                    child: Center(
                      child: FittedBox(
                        child: Text(subTitle,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
