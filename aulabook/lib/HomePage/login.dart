import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aulabook/Componentes/custom_button.dart';
import 'package:aulabook/Componentes/help_button.dart';
import 'package:aulabook/HomePage/register.dart';
import 'package:aulabook/SearchPage/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aulabook/HomePage/auth.dart';

void main() => runApp(const LoginScreenApp());

// AQUIIII
// class _LoginPageState extends State<LoginPage> {
//   String? errorMessage = '';
//   bool isLogin = true;
//   }

class LoginScreenApp extends StatelessWidget {
  const LoginScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'CircularXX',
        primaryColor: const Color(0xFFFD8204), // Primary color for light theme
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFFD8204),
          onPrimary: Colors.white,
          secondary: Color(0xFFFD8204),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'CircularXX',
        primaryColor: const Color(0xFFFD8204), // Primary color for dark theme
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFD8204),
          onPrimary: Colors.white,
          secondary: Color(0xFFFD8204),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AulaBook'),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F8FE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFFB8B8B8)),
                  onPressed: () {
                    print('Back button pressed');
                    Navigator.pop(context); // Navigate back to the previous screen
                  },
                  iconSize: 24,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minHeight: 40,
                    minWidth: 40,
                  ),
                  splashRadius: 24,
                ),
              ),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: HelpButton(),
            ),
          ],
        ),
        body: const LoginScreen(),
      ),
    );
  }
}



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              const SizedBox(height: 30),
              Text(
                'Ingresar su correo electrónico',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Correo electrónico',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Ingrese su contraseña',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Contraseña',
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreenApp()),
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
              const SizedBox(height: 20),
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
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                width: screenWidth * 0.85,
                height: screenWidth * 0.14,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MySearch()),
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






