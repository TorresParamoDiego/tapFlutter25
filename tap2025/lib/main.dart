import 'package:flutter/material.dart';
import 'package:tap2025/Screens/challenge_screen.dart';
//import 'package:tap2025/Screens/contador_screen.dart';
import 'package:tap2025/Screens/dashboard_screen.dart';
import 'package:tap2025/Screens/login_screen.dart';
import 'package:tap2025/Screens/popular_screen.dart';
import 'package:tap2025/network/api_popular.dart';
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
            "/api": (context) => PopularScreen() 
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