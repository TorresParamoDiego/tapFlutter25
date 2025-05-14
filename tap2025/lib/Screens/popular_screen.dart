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
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10),
                separatorBuilder: (context, index) => SizedBox(height: 10,),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ItemPopular(snapshot.data![index]);
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
  Widget ItemPopular(PopularModel){
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/loading.gif'), 
            image: NetworkImage(PopularModel.backdropPath)
          ),
          Container(
            color: Colors.black,
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              onTap: ()=>Navigator.pushNamed(context,'/detail',arguments: PopularModel),
              title: Text(PopularModel.title,style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.chevron_right_rounded,size: 30),
            )
            /*child: Text(
              PopularModel.title, 
              style: TextStyle(color: Colors.white),
            ),*/
          )
        ],
      ),
    );
  }

}
//listview.builder no se sabe cuantos resultados
//area donde esta el contenido, se expande : expanded