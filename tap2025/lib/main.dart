import 'package:flutter/material.dart';
//import 'package:tap2025/Screens/contador_screen.dart';
import 'package:tap2025/Screens/dashboard_screen.dart';
import 'package:tap2025/Screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Material App',
      home: LoginScreen(),
      routes: {//rutas nombrados
        "/dash": (context) => DashboardScreen()
        //etiqueta y su valor, /dash es un alias
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
*/