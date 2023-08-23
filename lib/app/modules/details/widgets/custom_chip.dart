import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({super.key, required this.text, this.borderRadius = 16.0});

  final String text;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(borderRadius)
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(text,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
