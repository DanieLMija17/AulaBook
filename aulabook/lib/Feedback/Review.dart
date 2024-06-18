import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:aulabook/Componentes/custom_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'CircularXX',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'CircularXX',
      ),
      home: RatingScreen(),
    );
  }
}

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _rating = 3; // Initial rating

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¿Cómo calificarías tu experiencia general con este salón?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.08, // Increased font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, index) {
                return Icon(
                  Icons.star,
                  color: index < _rating.floor()
                      ? Colors.yellow.shade600
                      : Colors.grey,
                  size: screenWidth * 0.1, // Increased star size
                );
              },
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 30),
            CustomButton(
              width: screenWidth * 0.85,
              height: screenWidth * 0.14,
              onPressed: () {
                // Aquí puedes manejar la acción del botón "Terminar"
                print('Rating submitted: $_rating');
              },
              label: 'Terminar',
            ),
            SizedBox(height: 16),
            CustomButton(
              width: screenWidth * 0.85,
              height: screenWidth * 0.14,
              onPressed: () {
                // Aquí puedes manejar la acción del botón "Saltar"
                print('Skip button pressed');
              },
              label: 'Saltar',
              buttonColor: Colors.grey.shade300, // Custom button color
            ),
          ],
        ),
      ),
    );
  }
}

