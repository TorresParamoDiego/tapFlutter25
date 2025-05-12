class PopularModel {
  String backdropPath;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  double voteAverage;
  int voteCount;
  // ** String? backdropPath;

  PopularModel({//constructor abreviado, lo mismo que this.algo=algo, lo hace automatico
  //las llaves indican que los parametros son nombrados, no importa el orden
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    // ** this.backdroppath, puede ser nulo
  });

  factory PopularModel.fromMap(Map<String,dynamic> movie){//para otro constructor con factory
    return PopularModel(
      id: movie['id'], 
      backdropPath: 'https://image.tmdb.org/t/p/w500/${movie['backdrop_path']}'
      //backdropPath: null
      ?? 'https://support.heberjahiz.com/hc/article_attachments/21013076295570', //  cualesens
      originalLanguage: movie['original_language'], 
      originalTitle: movie['original_title'], 
      overview: movie['overview'], 
      popularity: movie['popularity'], 
      posterPath: movie['poster_path'], 
      releaseDate: movie['release_date'], 
      title: movie['title'], 
      voteAverage: movie['vote_average'], 
      voteCount: movie['vote_count']
    );
  }

}
//requiered, obligatoriamente
/* no hay sobrecarga de constructores como en java
*/