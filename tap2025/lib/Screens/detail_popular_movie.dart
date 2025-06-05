import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tap2025/models/popular_model.dart';
import 'package:tap2025/network/api_actor.dart';
import 'package:tap2025/network/api_popular.dart';
import 'package:tap2025/utils/actor_list.dart';
import 'package:tap2025/utils/youtube_reproductor.dart';

class DetailPopularMovie extends StatefulWidget {
  const DetailPopularMovie({super.key});

  @override
  State<DetailPopularMovie> createState() => _DetailPopularMovieState();
}

class _DetailPopularMovieState extends State<DetailPopularMovie> {
  late PopularModel popular;
  late int index;
  String? idVideo;
  final apiFavorite = ApiPopular();
  late List<PopularModel> favoritas;
  bool cargando = true;
  
  late Map args;
  @override
  void initState() {
    super.initState();
    cargarFavoritas();
  }

  Future<void> cargarFavoritas() async {
    favoritas = await apiFavorite.getFavoriteMovies();
    cargando = false;

    setState(() {});
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as Map;
    popular=args['popular'] as PopularModel;
    index=args['index'] as int;
    if (idVideo == null) {
      obtenerVideo(popular.id).then((id) {
        setState(() {
          idVideo = id;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (cargando) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Hero(
              tag: 'transicion$index',
              child: Image.network(
                popular.posterPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(color: Colors.white.withOpacity(0)),
          ),
          if (idVideo == null)
            Positioned(
              top: 150,
              right: 50,
              left: 50,
              child: const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.black,
                ),
              ),
            )
          else
            Positioned(
              top: 90,
              left: 10,
              right: 10,
              child: YoutubeReproductor(idVideo: idVideo!),
            ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: 80,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      popular.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  if (favoritas.any((favorita) => popular.id == favorita.id))
                    IconButton(
                      onPressed: () async {
                        await apiFavorite.deleteFavorite(popular.id);
                        setState(() {
                          cargarFavoritas();
                        });
                      },
                      icon: Icon(Icons.favorite, color: Colors.red, size: 30),
                    )
                  else
                    IconButton(
                      onPressed: () async {
                        await apiFavorite.postFavorite(popular.id);
                        setState(() {
                          cargarFavoritas();
                        });
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 360,
            right: 20,
            left: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                alignment: Alignment.center,
                color: Colors.black.withOpacity(0.3),
                height: 160,
                child: SingleChildScrollView(
                  child: Text(
                    popular.overview.isNotEmpty
                        ? popular.overview
                        : 'No descripcion',
                    //overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 310,
            left: 60,
            right: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: Colors.white.withOpacity(0.4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_rate,
                      color:
                          popular.voteAverage > 8.5
                              ? const Color.fromARGB(255, 7, 255, 11)
                              : popular.voteAverage > 7
                              ? Colors.amber
                              : popular.voteAverage > 5
                              ? Colors.orange
                              : Colors.red,
                      size: 35,
                    ),
                    Text('${popular.voteAverage}'),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 220,
            left: 50,
            right: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                color: Colors.grey,
                child: Text(
                  'CAST',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Positioned(bottom: 20, child: ActorList(id: popular.id)),
        ],
      ),
    );
  }

  Future<String?> obtenerVideo(int id) async {
    final dio = Dio();
    final response = await dio.get(
      'https://api.themoviedb.org/3/movie/$id/videos?api_key=7eefa6dc3e98b814c9cef082957900ac',
    );
    final res = response.data['results'] as List;
    final trailerList =
        res
            .cast<Map<String, dynamic>>()
            .where(
              (video) =>
                  video['type'] == 'Trailer' && video['site'] == 'YouTube',
            )
            .toList();
    final trailer = trailerList.isNotEmpty ? trailerList.first : null;
    return trailer?['key'];
  }
}
/*
shattered preference, etiqueta valor, es como un arreglo asociativo en el telefono
las guarda y se puede recuperar aunque la aplicacion se cierre

almacenamiento en los navegadores. local storage
en flutter tambien se puede local storage

lo que se instala es la logica y no la base de datos en si
*/