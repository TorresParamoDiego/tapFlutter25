import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController conUser= TextEditingController();
  TextEditingController conPdw=TextEditingController();
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/minecraft.jpg')
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 60,
              child: Image.asset('assets/logo.png',width: 350,)
            ),
            Positioned(
              bottom: 150,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 231, 211, 96),
                ),
                width: 300,
                //color: Colors.black, no se puede tener decoration y color
                //el listView ocupa un lugar confinado o shrinjk wrap para no ocupar toda la pantalla
                child: ListView(//cuando sabes cuantos van, sino con . builder o separated
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      controller: conUser,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text("Nombre de usuario"),
                        border: OutlineInputBorder()
                      ),
                    ),
                    /*Container( para dar espacio, no es recomendable
                      height: 10,
                    ),*/
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: conPdw,
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text("Contraseña"),
                        //hintText: 'Contraseña',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 630,
              child: InkWell(//para poder recibir click
                onTap: (){
                  isLoading= true; 
                  setState(() {}); 
                  Future.delayed(Duration(seconds: 5)).then(
                    (value) {
                      Navigator.pushNamed(
                        context,
                        '/dash'
                      );
                    },
                  );
                  
                  //dynamic para cuando no sepamos que tipo de dato se regresa, o si es variable
                  /*Navigator.push(//Para hacer una navegacion entre pantallas tradicional, rutas normales
                    context, 
                    MaterialPageRoute(
                      builder:(context) => DashboardScreen(),
                    )
                  );*/
                },
                  child: Lottie.asset('assets/boton.json',width: 220)
              ),
            ),
            Positioned(
              top: 200,
              child: isLoading ? Lottie.asset('assets/loading.json',height: 100) : Container()
            ),
          ],
        ),
      ),
    );
    
  }
}
/*

*/