import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDatabase{
  static const NAMEDB='USERDB';
  static const VERSIONDB=1;
  static Database? _database;

  Future<Database?> get database async {//patron single ton
    //validar que solo exista una instancia de la conexion
    if(_database !=null) return _database;
    return _database = await initDatabase(); 
  }
  
  Future<Database?> initDatabase()async {//construir la BD, se necesita accesar al sistema de archivos
    Directory folder = await getApplicationDocumentsDirectory(); //ruta hacia el folder
    String path = join(folder.path,NAMEDB);
    return openDatabase(
      path,
      version: VERSIONDB,
      onCreate: (db, version) {
        String query ='''create table tblUsers(
          idUser INTEGER PRIMARY KEY,
          userName varchar(50),
          passName varchar(32)
        )
        ''';
        db.execute(query);//con esto de ejecuta lo de arriba
      },

    );
  }
  Future<int> INSERT(Map<String,dynamic> data)async{//en el mapa se debe llamar igual al de la tabla
    final con=await database;//esto es un metodo, llama al get
    return con!.insert(
      'tblUsers', 
      data
    );//regresa el id del ultimo elemento insertado
  }
  Future<int> UPDATE(Map<String,dynamic> data)async{
    final con=await database;
    return con!.update(//retorna el numero de elementos cambiados
      'tblUsers', 
      data,
      where: 'idUser=?', //consulta parametrizada, una forma de seguridad
      whereArgs: [data['idUser']]
    );
  }
  DELETE(){

  }
  SELECT(){

  }
}
/*
  _ indica que la variable es privada
  single ton que solo exista una instancia
 */