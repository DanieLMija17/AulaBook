import 'package:flutter/material.dart';
import 'package:aulabook/Componentes/custom_button.dart';
import 'package:aulabook/HomePage/login.dart';

void main() => runApp(RegisterScreenApp());

class RegisterScreenApp extends StatelessWidget {
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
        ),
        body: RegisterScreen(),
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
            ),
          ],
        );
      },
    );
  }

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
                controller: emailController,
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
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Contraseña',
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                width: screenWidth * 0.85,
                height: screenWidth * 0.14,
                onPressed: () {
                  if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                    _showErrorDialog("Debe introducir un correo y una contraseña para crear la cuenta.");
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreenApp()),
                    );
                  }
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
