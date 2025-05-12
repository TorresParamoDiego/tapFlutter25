import 'package:flutter/material.dart';
import 'package:tap2025/Screens/challenge_screen.dart';
import 'package:tap2025/Screens/dashboard_screen.dart';
import 'package:tap2025/Screens/detail_popular_movie.dart';
import 'package:tap2025/Screens/login_screen.dart';
import 'package:tap2025/Screens/popular_screen.dart';
import 'package:tap2025/utils/global_values.dart';
import 'package:tap2025/utils/theme_settings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
      valueListenable: GlobalValues.themeMode,
      builder: (context,value,Widget) {
        return MaterialApp(
          theme: value==1 ? ThemeData.light() : value==0 ? ThemeData.dark() : ThemeSettings.customTheme(),
          title: 'Material App',
          home: LoginScreen(),
          routes: {//rutas nombrados
            "/dash": (context) => DashboardScreen(),
            "/reto": (context) => ChallengeScreen(),
            "/api": (context) => PopularScreen(),
            "/detail": (context) => DetailPopularMovie()
            //etiqueta y su valor, /dash es un alias
          },
        );
      },
    );
  }
}
/*
  Arreglos indexados
  Arreglos asociativos
  En flutter los mapas son arreglos asociativos, tambien json
  Un mapa se homologa con un mapa
  Mapa entre llaves, y asociativa
  string-dynamic
*/
/*
  SQLite 
  Bases de datos locales
  app-server,
  no se ocupa socket
  el puerto indica el servicio 3306, mysql, 1433 SQLserver, 5432 postgress, 433 https
  no esta directamente, entonces paquete SQflite
  identity similar al auto_increment en sql

  *en sqflite Auto incremento
    PK
    Integer
  *Relacional
    correspondencia
    las relaciones foraneas estan rotas, producto se puede insertar sin categoria, nosotros debemos cuida
    Tambien se pueden activar, para validar las peticiones, de forma manual
  *No hay create database, se crea atraves de una clase
  
  Algo curioso, al programar en moviles se esta limitado en memoria ram, almacenamiento, procesador, bateria, datos
  ROM (Read Only Memory), solo lectura

    persistencia, que se mantenga en el tiempo, archivos
*/