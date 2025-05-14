import 'package:flutter/material.dart';
import 'package:tap2025/models/popular_model.dart';

class DetailPopularMovie extends StatefulWidget {
  const DetailPopularMovie({super.key});

  @override
  State<DetailPopularMovie> createState() => _DetailPopularMovieState();
}

class _DetailPopularMovieState extends State<DetailPopularMovie> {
  @override
  Widget build(BuildContext context) {
    print('as');
    final popular=ModalRoute.of(context)!.settings.arguments as PopularModel;
    return Container();
  }
}
/*
shattered preference, etiqueta valor, es como un arreglo asociativo en el telefono
las guarda y se puede recuperar aunque la aplicacion se cierre

almacenamiento en los navegadores. local storage
en flutter tambien se puede local storage

lo que se instala es la logica y no la base de datos en si
*/