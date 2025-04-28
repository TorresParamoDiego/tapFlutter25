import 'package:flutter/material.dart';

class ThemeSettings{
  
  static ThemeData customTheme(){
    final theme =ThemeData.light().copyWith(
      colorScheme: ColorScheme(
        brightness: Brightness.light, 
        primary: const Color.fromARGB(255, 252, 162, 59), 
        onPrimary: const Color.fromARGB(255, 185, 42, 42),
        secondary: const Color.fromARGB(255, 0, 0, 0), 
        onSecondary: Colors.red, 
        error: Colors.red, 
        onError: Colors.red, 
        surface: const Color.fromARGB(255, 223, 110, 58), 
        onSurface: const Color.fromARGB(255, 129, 16, 21), 
      ),
      scaffoldBackgroundColor: Color.fromARGB(255, 235, 207, 104)
    );
    return theme;
  }

}
/* copiar atributos para pasarlos a otro objeto y modificarlo

API, telefonos no se puede conectar con un socket a la BD
La API corre en un servidor y expone URL para que se pueda hacer algo a la tabla
Medio de comunicacion seguro entre 2 origen base de datos, destino app, solo permite exponer lo que el desarrollador quiere
Las URL trabajan sobre rest o soap, no se usa soap
XML y JSon para intercambiar recursos entre el servidor y la app
rest con Json, rest es un protocolo, los protocolos son reglas necesarias para establecer la comunicacion entre un punto A y B
rest trabaja sobre un puerto, puerto 80 ó  443  (https), es muy dificil que lo bloquea una empresa
80 http, todos los protocolos trabajan sobre un puerto
  get, post, put y delete, son peticiones http
  metodo get semejante al select
  post insert, mandar un json adjunto
  put update, mandar datos adjuntos
  delete delete, no es necesario, aveces se manda el dato por la url
  con una sola url se pueden hacer las 4 peticiones
xml es muy parecido al html
etiquetas son datos
Desarrollador optimiza con json
json es mas simple

Autenticacion basada en token
  peticion post para mandar credenciales al servidor, el servidor las valida
  el servidor responde con 200 =valido, retorna jwt (json web token)(muy seguro),
  get lleva adjunto el token, servidor recibe y valida el token, regresa el resultado de la peticion, 
  lo recibe la aplicacion y la procesa
*/