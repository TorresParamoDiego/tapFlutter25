import 'package:dio/dio.dart';
import 'package:tap2025/models/actor_model.dart';

class ApiActor {
  late String URL;
  ApiActor(int id){
    URL='https://api.themoviedb.org/3/movie/$id/credits?api_key=7eefa6dc3e98b814c9cef082957900ac';
  }
  Future<List<ActorModel>> getActors()async {
    final dio = Dio();
    final response = await dio.get(URL);
    final res= response.data['cast'] as List;
    res.sort((a, b) => a['order'].compareTo(b['order']));
    final actores=res.take(10).toList();
    return actores.map((actor) => ActorModel.fromMap(actor)).toList();
  }
}