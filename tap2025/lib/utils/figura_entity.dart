import 'dart:ui';

import 'package:flutter/material.dart';

class FiguraEntity {
  final String name;
  final String image;
  final String price;
  final Color color;
  final String dscp;
  FiguraEntity({
    required this.name,
    required this.image,
    required this.price,
    required this.color,
    required this.dscp,
  });

}

final figuraList =[
  FiguraEntity(
    name: 'Sanji', 
    image: 'https://acdn-us.mitiendanube.com/stores/001/989/991/products/9-9a8cc2e8beb371426517436087856267-640-0.png', 
    price: '120.99', 
    color: const Color.fromARGB(255, 255, 231, 17),
    dscp: 'Figura del popular personaje del anime de One Piece, "Sanji"',
  ),
  FiguraEntity(
    name: 'Luffy', 
    image: 'https://fbi.cults3d.com/uploaders/27976287/illustration-file/9c6893e2-b05b-45b8-b58f-294cce12471d/04.png', 
    price: '120.99', 
    color: const Color.fromARGB(255, 255, 17, 17),
    dscp: 'Figura del popular personaje del anime de One Piece, "Luffy"',
  ),
];