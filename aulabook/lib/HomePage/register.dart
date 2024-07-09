import 'package:flutter/material.dart';
import 'package:aulabook/Componentes/custom_button.dart';

void main() => runApp(const RegisterScreenApp());

class RegisterScreenApp extends StatelessWidget {
  const RegisterScreenApp({super.key});

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
        ),
        body: const RegisterScreen(),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                'Regístrese',
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
              CustomButton(
                width: screenWidth * 0.85,
                height: screenWidth * 0.14,
                onPressed: () {
                  // Handle registration
                },
                label: 'Crear cuenta',
              ),
            ],
          ),
        ),
      ),
    );
  }
}