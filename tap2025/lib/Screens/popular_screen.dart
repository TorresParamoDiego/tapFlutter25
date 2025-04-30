import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tap2025/network/api_popular.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {

  ApiPopular? apiPopular;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiPopular=ApiPopular();
    //apiPopular!.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: apiPopular!.getPopularMovies(), 
          builder: (context, snapshot) {//snapshot trae la lista de resultados
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Text(snapshot.data![index].title);
                },
              );
            }
            else if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()),);
            }
            else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
    );
  }
}
//listview.builder no se sabe cuantos resultados