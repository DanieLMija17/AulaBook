import 'package:flutter/material.dart';
import 'package:aulabook/Componentes/custom_button.dart';
import 'package:aulabook/SearchPage/search.dart';
// import 'package:postgres/postgres.dart';
import 'package:supabase_flutter/supabase_flutter.dart';






void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
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
      home: InicioScreen(),
    );
  }
}




class InicioScreen extends StatelessWidget {
  final SupabaseClient supabaseClient;

   InicioScreen({Key? key})
      : supabaseClient = SupabaseClient(
          'https://jadjzhtigrudcopshqnm.supabase.co', // Reemplaza con tu URL de Supabase
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImphZGp6aHRpZ3J1ZGNvcHNocW5tIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTg3NTc3NzAsImV4cCI6MjAzNDMzMzc3MH0._DFGa5fZQpZGI-vAnoESq1ixvOMSX6dsvsx89YC2StY', // Reemplaza con tu clave pública de Supabase
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: screenWidth * 0.1), // Ajuste responsivo para el espacio superior
              Text(
                'AulaBook',
                style: TextStyle(
                  fontSize: screenWidth * 0.12, // Ajuste responsivo para el tamaño del texto
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.05), // Ajuste responsivo para el margen izquierdo
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth * 0.85, // Ancho igual al botón
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reserva tu',
                            style: TextStyle(
                              fontSize: screenWidth * 0.06, // Ajuste responsivo para el tamaño del texto
                            ),
                          ),
                          Text(
                            'Aula sin problemas!',
                            style: TextStyle(
                              fontSize: screenWidth * 0.08, // Ajuste responsivo para el tamaño del texto
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.05), // Espacio responsivo entre el texto y el botón
                    CustomButton(
                      width: screenWidth * 0.85,
                      height: screenWidth * 0.14,
                      onPressed: () {
                        // Navegar a la segunda vista cuando se presiona el botón
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MySearch()),
                        );
                      },
                      label: 'Comenzar',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// // Logica de connecion a la base de datos 
// class AulasList extends StatefulWidget {
//   @override
//   _AulasListState createState() => _AulasListState();
// }

// class _AulasListState extends State<AulasList> {
//   late PostgreSQLConnection connection;
//   List<Map<String, dynamic>> aulas = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     connectToDatabase();
//   }

//     Future<void> connectToDatabase() async {

//     try {
//     connection = PostgreSQLConnection(
//       'postgres://postgres.jadjzhtigrudcopshqnm:[YOUR-PASSWORD]@aws-0-us-west-1.pooler.supabase.com:6543/postgres', //  URL del host en Supabase
//       6543, // Puerto de la bd
//       'postgres', // nombre de tu base de datos
//       username: 'postgres.jadjzhtigrudcopshqnm', // usuario de supabase
//       password: 'geomadre17*', //contraseña de la bd
//       );

//       await connection.open();
//       print('Conexión a la base de datos exitosa');
//       await fetchAulas();
//     } catch (e) {
//       print('Error al conectar a la base de datos: $e');
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//     Future<void> fetchAulas() async {
//     List<List<dynamic>> results = await connection.query('SELECT * FROM aulas');

//     setState(() {
//       aulas = results.map((row) {
//         return {
//           'id': row[0],
//           'nombre': row[1],
//           'capacidad': row[2],
//         };
//       }).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: aulas.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(aulas[index]['nombre'] as String),
//           subtitle: Text('Capacidad: ${aulas[index]['capacidad']}'),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     connection.close();
//     super.dispose();
//   }
// }


