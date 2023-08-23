import 'package:flutter/material.dart';

import '../../../data/utils/colors.dart';

class SquareButton extends StatelessWidget {
  const SquareButton({
    required this.onTap,
    required this.icon,
    super.key,
  });

  final Function()? onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 25, width: 25,
          decoration: BoxDecoration(
              color: mainColor.shade200,
              borderRadius: BorderRadius.circular(8.0)
          ),
          child: icon,
        ),
      ),
    );
  }
}