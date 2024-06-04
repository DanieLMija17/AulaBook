import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                  onPressed: () {},
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
        body: DescriptionWidget(),
      ),
    );
  }
}

class DescriptionWidget extends StatefulWidget {
  @override
  _DescriptionWidgetState createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/salon_unimet1.jpg',
              width: 335,
              height: 300, // Ajustamos la altura para que entre en la pantalla
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16), // Espacio entre la imagen y el texto "A1-204"
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
            _isExpanded
                ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget porta tellus, non ultricies risus. Nam et metus eget ipsum tempor consequat et eget risus. Donec vel felis euismod, gravida nisi nec, ultrices ipsum. Integer pulvinar odio ac ligula dignissim, non luctus metus tempus. Phasellus malesuada libero nec nisl fermentum, eget tristique urna bibendum. Suspendisse vel libero vel purus consectetur dictum. Cras non scelerisque felis. Vestibulum sit amet sapien semper, aliquet felis sit amet, fringilla leo. Nulla facilisi. Nulla at dui non urna consequat facilisis. Mauris aliquet dui id arcu vulputate, ac feugiat nisl dapibus. Ut id nunc in ex malesuada condimentum.'
                : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget porta tellus, non ultricies risus. Nam et metus eget ipsum tempor consequat et eget risus....',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              icon: Icon(
                _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: Color(0xFFFD8204),
              ),
              label: Text(
                _isExpanded ? 'Leer menos' : 'Leer más',
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
    );
  }
}




