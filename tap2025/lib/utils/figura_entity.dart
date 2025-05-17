import 'dart:ui';

import 'package:flutter/material.dart';

class FiguraEntity {
  final String name;
  final String image;
  final String price;
  final Color color;
  FiguraEntity({
    required this.name,
    required this.image,
    required this.price,
    required this.color,
  });

}

final figuraList =[
  FiguraEntity(
    name: 'Sanji', 
    image: 'assets/sanji.png', 
    price: '120.99', 
    color: const Color.fromARGB(255, 255, 231, 17)
  ),
  FiguraEntity(
    name: 'Luffy', 
    image: 'assets/luffy.png', 
    price: '120.99', 
    color: const Color.fromARGB(255, 255, 17, 17)
  ),
];