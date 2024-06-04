import 'package:flutter/material.dart';

// Image.asset('assets/salon_unimet1.jpg')

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AulaBook'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'A1-204',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 16),
                  SizedBox(width: 4),
                  Text('4.5 (355 Reviews)', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget porta tellus, non ultricies risus. Nam et metus eget ipsum tempor consequat et eget risus....',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFFFD8204)),
                  label: Text(
                    'Leer más',
                    style: TextStyle(color: Color(0xFFFD8204)),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    side: BorderSide.none,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Comodidades',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.wifi),
                  SizedBox(width: 8),
                  Text('Wifi', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.group),
                  SizedBox(width: 8),
                  Text('26 Puestos', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Icon(Icons.business),
                      SizedBox(height: 8),
                      Icon(Icons.ac_unit),
                    ],
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('2 Pizarras', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8),
                      Text('Aire', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Center(
                child: SizedBox(
                  width: 330,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFD8204), // Color de fondo
                      foregroundColor: Colors.white, // Color del texto
                      textStyle: TextStyle(fontSize: 16),
                    ),
                    child: Text('Reservar'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}