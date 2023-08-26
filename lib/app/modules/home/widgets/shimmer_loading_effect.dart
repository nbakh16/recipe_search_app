import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ShimmerLoadingEffect extends StatelessWidget {
  const ShimmerLoadingEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth<700 ? 2 : screenWidth<900 ? 3 : 4,
            childAspectRatio: 0.85
        ),
        itemCount: 24,
        itemBuilder: (context, index) {
          return Animate(
            effects: [ShimmerEffect(delay: 500.ms)],
            onPlay: (controller) => controller.repeat(),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(6.0)
              ),
            ),
          );
        }
    );
  }
}