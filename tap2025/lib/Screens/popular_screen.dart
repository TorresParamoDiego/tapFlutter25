import 'package:flutter/material.dart';
import 'package:tap2025/network/api_popular.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  late String tipo;
  ApiPopular? apiPopular;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiPopular = ApiPopular();
    //apiPopular!.getPopularMovies();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    tipo = ModalRoute.of(context)!.settings.arguments as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tipo)),
      body: FutureBuilder(
        future:
            tipo == 'Popular'
                ? apiPopular!.getPopularMovies()
                : apiPopular!.getFavoriteMovies(),
        builder: (context, snapshot) {
          //snapshot trae la lista de resultados
          if (snapshot.hasData) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ItemPopular(snapshot.data![index],index);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget ItemPopular(popular,index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(popular.backdropPath),
          ),
          Container(
            color: Colors.black,
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              leading: Hero(
                tag: 'transicion$index',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    popular.posterPath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap:
                  () => Navigator.pushNamed(
                    context,
                    '/detail',
                    arguments: {
                      'popular':popular,
                      'index':index
                    }
                  ),
              title: Text(
                popular.title,
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.chevron_right_rounded, size: 30),
            ),
            /*child: Text(
              PopularModel.title, 
              style: TextStyle(color: Colors.white),
            ),*/
          ),
        ],
      ),
    );
  }
}
//listview.builder no se sabe cuantos resultados
//area donde esta el contenido, se expande : expanded