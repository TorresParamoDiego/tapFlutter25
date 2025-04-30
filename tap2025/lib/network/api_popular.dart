import 'package:dio/dio.dart';
import 'package:tap2025/models/popular_model.dart';

class ApiPopular {
  
  final String URL='https://api.themoviedb.org/3/movie/popular?api_key=5019e68de7bc112f4e4337a500b96c56&language=es-MX&page=1';

  Future<List<PopularModel>> getPopularMovies()async {
    final dio = Dio();
    final response = await dio.get(URL);
    final res= response.data['results'] as List;
    return res.map((movie) => PopularModel.fromMap(movie)).toList();
  }
}
/* 
la peticion debe ir en segundo plano
diferencia entre dio y http, dio maneja cache y la http no7
await desmenuza la response de get, si no no se puede acceder a todos los datos

la funcion map es como un for ish, por cada elemento se hace un cierto codigo
*/