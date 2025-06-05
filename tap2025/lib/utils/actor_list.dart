import 'package:flutter/material.dart';
import 'package:tap2025/models/actor_model.dart';
import 'package:tap2025/network/api_actor.dart';

class ActorList extends StatefulWidget {
  final int id;
  ActorList({super.key, required this.id});

  @override
  State<ActorList> createState() => _ActorListState();
}

class _ActorListState extends State<ActorList> {
  late ApiActor apiActor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    apiActor=ApiActor(widget.id);
    return FutureBuilder(
          future: apiActor.getActors(), 
          builder: (context, snapshot) {//snapshot trae la lista de resultados
            if(snapshot.hasData){
              return Container(
                height: 190,
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  separatorBuilder: (context, index) => SizedBox(width: 10,),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Item(snapshot.data![index]);
                  },
                ),
              );
            }
            else if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()),);
            }
            else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        );
  }
  Widget Item(ActorModel){
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 300,
        width: 110,
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
              width: 110,
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'), 
                image: NetworkImage(
                  ActorModel.profilePath,
                ),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                child: SingleChildScrollView(
                  child: Text(
                    '${ActorModel.name} (${ActorModel.character})',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12
                    ),
                    maxLines: 3,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
