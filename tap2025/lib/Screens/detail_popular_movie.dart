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
    final popular=ModalRoute.of(context)!.settings.arguments as PopularModel;
    return Container();
  }
}