import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.black87,
          ),
        ),
        Container(
          height: 4,
          width: MediaQuery.sizeOf(context).width * 0.25,
          color: Colors.amberAccent,
        ),
      ],
    );
  }
}
