import 'package:flutter/material.dart';
import 'package:aulabook/AulaInfo/aula.dart';
import 'package:aulabook/HomePage/main.dart';


void main() => runApp(const MySearch());

class MySearch extends StatelessWidget {
  const MySearch({super.key});
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
          title: Text('Search'),
          foregroundColor: Colors.orange,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.orange),
              onPressed: () {
                // Aquí puedes agregar la lógica para cerrar sesión
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Main()),
                  );
                // Navegar a la pantalla de inicio de sesión o realizar cualquier otra acción necesaria
              },
            ),
          ],
        ),
        body: SearchPage(),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  final List<Category> categories = [
    Category(icon: Icons.class_, label: 'Salon'),
    Category(icon: Icons.science, label: 'Laboratorio'),
    Category(icon: Icons.apartment, label: 'Modulo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Buscar',
              prefixIcon: Icon(Icons.search, color: Colors.orange),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (categories[index].label == 'Salon') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Aula()),
                      );
                    } else {
                      print('Pressed ${categories[index].label}');
                    }
                  },
                  child: Column(
                    children: [
                      Icon(categories[index].icon,
                          size: 40, color: Colors.orange),
                      SizedBox(height: 8),
                      Text(categories[index].label,
                          style: TextStyle(color: Colors.orange)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Category {
  final IconData icon;
  final String label;

  Category({required this.icon, required this.label});
}


// class Category {
//   final IconData icon;
//   final String label;

//   Category({required this.icon, required this.label});
// }