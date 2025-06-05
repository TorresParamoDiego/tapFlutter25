import 'package:dio/dio.dart';
import 'package:tap2025/models/popular_model.dart';

class ApiPopular {
  final String URL =
      'https://api.themoviedb.org/3/movie/popular?api_key=5019e68de7bc112f4e4337a500b96c56&language=es-MX&page=1';
  final String URL2 =
      'https://api.themoviedb.org/3/account/21942240/favorite/movies?api_key=7eefa6dc3e98b814c9cef082957900ac&session_id=b799afc97fef7dbd11e34ddc1c384d2ce223a76b';
  final String URL3 =
      'https://api.themoviedb.org/3/account/21942240/favorite?api_key=7eefa6dc3e98b814c9cef082957900ac&session_id=b799afc97fef7dbd11e34ddc1c384d2ce223a76b';
  Future<List<PopularModel>> getPopularMovies() async {
    final dio = Dio();
    final response = await dio.get(URL);
    final res = response.data['results'] as List;
    return res.map((movie) => PopularModel.fromMap(movie)).toList();
  }

  Future<List<PopularModel>> getFavoriteMovies() async {
    final dio = Dio();
    final response = await dio.get(URL2);
    final res = response.data['results'] as List;
    return res.map((movie) => PopularModel.fromMap(movie)).toList();
  }

  Future<void> postFavorite(int idMovie) async {
    final dio = Dio();
    final data = {"media_type": "movie", "media_id": idMovie, "favorite": true};
    final response = await dio.post(
      URL3,
      data: data,
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
  }

  Future<void> deleteFavorite(int idMovie) async {
    final dio = Dio();
    final data = {
      "media_type": "movie",
      "media_id": idMovie,
      "favorite": false,
    };
    final response = await dio.post(
      URL3,
      data: data,
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
  }
}
/* 
la peticion debe ir en segundo plano
diferencia entre dio y http, dio maneja cache y la http no7
await desmenuza la response de get, si no no se puede acceder a todos los datos

la funcion map es como un for ish, por cada elemento se hace un cierto codigo

https://api.themoviedb.org/3/movie/popular?api_key=7eefa6dc3e98b814c9cef082957900ac

https://api.themoviedb.org/3/movie/950387?api_key=7eefa6dc3e98b814c9cef082957900ac

*/