import 'package:flutter/material.dart';

class SimpleRatingBar extends StatelessWidget {
  final Color color;
  const SimpleRatingBar({super.key, required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index)=> Icon(
          Icons.star,
          color: color,
          size: 18,
        ),
      ),
    );
  }
}
