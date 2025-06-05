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
  FiguraEntity(
    name: 'Nami', 
    image: 'https://solarisjapan.com/cdn/shop/products/item_000000000518_DhJ8Ssee_04-removebg-preview.png?v=1610079263', 
    price: '150.99', 
    color: const Color.fromARGB(255, 255, 132, 9), 
    dscp: 'Figura de Nami de one piece, navegante de los sombreros de paja',
  ),
  FiguraEntity(
    name: 'Zoro', 
    image: 'https://static.xtralife.com/conversions/WJC8-50RR526730-medium_w640_h480_q75-bdisd666253jpg-1722595423.webp', 
    price: '100.99', 
    color: const Color.fromARGB(255, 5, 117, 16), 
    dscp: 'Figura de Zoro de one piece, espadachin de los sombreros de paja'
  ),
  FiguraEntity(
    name: 'Robin', 
    image: 'https://cdnx.jumpseller.com/poderanime/image/48162026/resize/610/610?1714688137', 
    price: '130.99',
    color: const Color.fromARGB(255, 171, 5, 180), 
    dscp: 'Figura de Nico Robin, arqueologa de los sombrero de paja'
  ),

];