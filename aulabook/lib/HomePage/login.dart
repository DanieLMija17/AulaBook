import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aulabook/Componentes/custom_button.dart';
import 'package:aulabook/Componentes/help_button.dart';
import 'package:aulabook/HomePage/register.dart';
import 'package:aulabook/SearchPage/search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const LoginScreenApp());
}

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
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> _signInWithEmailPassword() async {
    setState(() {
      isLoading = true;
    });

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      User? user = userCredential.user;
      print('User signed in: ${user?.email}'); // Ejemplo de uso de la variable

      // Usuario ha iniciado sesión correctamente
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MySearch()),
      );
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
      // Manejar errores
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return Scaffold(
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
                  Navigator.pop(
                      context); // Navigate back to the previous screen
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
      body: Center(
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
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
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
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Contraseña',
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreenApp()),
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
                isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        width: screenWidth * 0.85,
                        height: screenWidth * 0.14,
                        onPressed: _signInWithEmailPassword,
                        label: 'Iniciar Sesión',
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
      ),
    );
  }
}
