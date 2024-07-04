import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aulabook/Componentes/custom_button.dart';
import 'package:aulabook/Componentes/help_button.dart';
import 'package:aulabook/HomePage/register.dart';
import 'package:aulabook/SearchPage/search.dart';

void main() => runApp(LoginScreenApp());

class LoginScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'CircularXX',
        primaryColor: Color(0xFFFD8204), // Primary color for light theme
        colorScheme: ColorScheme.light(
          primary: Color(0xFFFD8204),
          onPrimary: Colors.white,
          secondary: Color(0xFFFD8204),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'CircularXX',
        primaryColor: Color(0xFFFD8204), // Primary color for dark theme
        colorScheme: ColorScheme.dark(
          primary: Color(0xFFFD8204),
          onPrimary: Colors.white,
          secondary: Color(0xFFFD8204),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('AulaBook'),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF3F8FE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xFFB8B8B8)),
                  onPressed: () {
                    print('Back button pressed');
                    Navigator.pop(context); // Navigate back to the previous screen
                  },
                  iconSize: 24,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(
                    minHeight: 40,
                    minWidth: 40,
                  ),
                  splashRadius: 24,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: HelpButton(),
            ),
          ],
        ),
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Iniciar Sesión',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Ingresar su correo electrónico',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Correo electrónico',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Ingrese su contraseña',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Contraseña',
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreenApp()),
                  );
                },
                child: Text(
                  'No tiene cuenta? Regístrese',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle Google login
                },
                icon: SvgPicture.asset(
                  'assets/images/google1.svg', // Make sure this path is correct
                  width: 24,
                  height: 24,
                ),
                label: Text(
                  'Iniciar Sesión con Google',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: screenWidth * 0.045,
                  ),
                  minimumSize: Size(screenWidth * 0.85, screenWidth * 0.14),
                  side: BorderSide(color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                width: screenWidth * 0.85,
                height: screenWidth * 0.14,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MySearch()),
                  );
                },
                label: 'Siguiente',
              ),
            ],
          ),
        ),
      ),
    );
  }
}






