import 'package:flutter/material.dart';
import 'package:aulabook/Componentes/custom_button.dart';
import 'package:aulabook/Reserva/dateAndtimePickers.dart';

void main() {
  runApp(const Aula());
}

class Aula extends StatelessWidget {
  const Aula({super.key});

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
                    Navigator.pop(context);
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
        body: const DescriptionWidget(),
      ),
    );
  }
}

class DescriptionWidget extends StatefulWidget {
  const DescriptionWidget({super.key});

  @override
  _DescriptionWidgetState createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/images/salon_unimet1.jpg',
              width: screenWidth * 0.9,
              height: screenWidth * 0.8,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'A1-204',
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow, size: screenWidth * 0.04),
              const SizedBox(width: 4),
              Text('4.5 (355 Reviews)',
                  style: TextStyle(fontSize: screenWidth * 0.04)),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _isExpanded
                ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget porta tellus, non ultricies risus. Nam et metus eget ipsum tempor consequat et eget risus. Donec vel felis euismod, gravida nisi nec, ultrices ipsum. Integer pulvinar odio ac ligula dignissim, non luctus metus tempus. Phasellus malesuada libero nec nisl fermentum, eget tristique urna bibendum. Suspendisse vel libero vel purus consectetur dictum. Cras non scelerisque felis. Vestibulum sit amet sapien semper, aliquet felis sit amet, fringilla leo. Nulla facilisi. Nulla at dui non urna consequat facilisis. Mauris aliquet dui id arcu vulputate, ac feugiat nisl dapibus. Ut id nunc in ex malesuada condimentum.'
                : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget porta tellus, non ultricies risus. Nam et metus eget ipsum tempor consequat et eget risus....',
            style: TextStyle(fontSize: screenWidth * 0.04),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              icon: Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: const Color(0xFFFD8204),
              ),
              label: Text(
                _isExpanded ? 'Leer menos' : 'Leer más',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: const Color(0xFFFD8204),
                ),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Comodidades',
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.wifi, size: screenWidth * 0.06),
              const SizedBox(width: 8),
              Text('Wifi', style: TextStyle(fontSize: screenWidth * 0.04)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.group, size: screenWidth * 0.06),
              const SizedBox(width: 8),
              Text('26 Puestos',
                  style: TextStyle(fontSize: screenWidth * 0.04)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Icon(Icons.business, size: screenWidth * 0.06),
                  const SizedBox(height: 8),
                  Icon(Icons.ac_unit, size: screenWidth * 0.06),
                ],
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('2 Pizarras',
                      style: TextStyle(fontSize: screenWidth * 0.04)),
                  const SizedBox(height: 8),
                  Text('Aire', style: TextStyle(fontSize: screenWidth * 0.04)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomButton(
            width: screenWidth * 0.85,
            height: screenWidth * 0.14,
            onPressed: () {
              // Navegar a la segunda vista cuando se presiona el botón
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DateAndTimePickers()),
              );
            },
            label: 'Reservar',
          ),
        ],
      ),
    );
  }
}
