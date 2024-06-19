import 'package:flutter/material.dart';
import 'package:aulabook/Componentes/custom_button.dart';
import 'package:aulabook/SearchPage/search.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, // Esto hace que la aplicación use el tema del sistema (claro u oscuro)
      theme: ThemeData(
        brightness: Brightness.light, // Tema claro
        fontFamily: 'CircularXX',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Tema oscuro
        fontFamily: 'CircularXX',
      ),
      home: InicioScreen(),
    );
  }
}

class InicioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: screenWidth * 0.1), // Ajuste responsivo para el espacio superior
              Text(
                'AulaBook',
                style: TextStyle(
                  fontSize: screenWidth * 0.12, // Ajuste responsivo para el tamaño del texto
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.05), // Ajuste responsivo para el margen izquierdo
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth * 0.85, // Ancho igual al botón
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reserva tu',
                            style: TextStyle(
                              fontSize: screenWidth * 0.06, // Ajuste responsivo para el tamaño del texto
                            ),
                          ),
                          Text(
                            'Aula sin problemas!',
                            style: TextStyle(
                              fontSize: screenWidth * 0.08, // Ajuste responsivo para el tamaño del texto
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.05), // Espacio responsivo entre el texto y el botón
                    CustomButton(
                      width: screenWidth * 0.85,
                      height: screenWidth * 0.14,
                      onPressed: () {
                        // Navegar a la segunda vista cuando se presiona el botón
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MySearch()),
                        );
                      },
                      label: 'Comenzar',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}