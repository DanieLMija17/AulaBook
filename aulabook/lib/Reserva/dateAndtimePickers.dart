import 'package:flutter/material.dart';
import 'package:aulabook/Componentes/custom_button.dart';
import 'package:aulabook/Componentes/help_button.dart';
import 'package:intl/intl.dart';
import 'package:aulabook/Feedback/Review.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() => runApp(DateAndTimePickers());

class DateAndTimePickers extends StatelessWidget {
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
                    Navigator.pop(
                        context); // Navigate back to the previous screen
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
          actions: [
            HelpButton(),
          ],
        ),
        body: DateTimePickerScreen(),
      ),
    );
  }
}

class DateTimePickerScreen extends StatefulWidget {
  @override
  _DateTimePickerScreenState createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _aula;
  String? _descripcion;
  String? _status;
  String? _categoria;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(), // Only allow dates from today onwards
      lastDate: DateTime(2101),
      selectableDayPredicate: (DateTime date) {
        return date.weekday != DateTime.sunday; // Disable Sundays
      },
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFFFD8204), // Header background color
              onPrimary: Colors.white, // Header text color
              surface: Colors.white, // Background color of date picker
              onSurface: Colors.black, // Text color of date picker
            ),
            dialogBackgroundColor: Colors.white, // Background color of dialog
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final List<TimeOfDay> availableTimes = [
      TimeOfDay(hour: 7, minute: 0),
      TimeOfDay(hour: 8, minute: 45),
      TimeOfDay(hour: 10, minute: 30),
      TimeOfDay(hour: 12, minute: 15),
      TimeOfDay(hour: 14, minute: 0),
      TimeOfDay(hour: 15, minute: 45),
      TimeOfDay(hour: 17, minute: 30),
      TimeOfDay(hour: 19, minute: 15),
    ];

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          child: ListView.builder(
            itemCount: availableTimes.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(availableTimes[index].format(context)),
                onTap: () {
                  setState(() {
                    _selectedTime = availableTimes[index];
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(
              "Debes seleccionar una fecha y una hora antes de continuar."),
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

  Future<void> _guardarReserva() async {
    if (_selectedDate != null &&
        _selectedTime != null &&
        _aula != null &&
        _status != null &&
        _descripcion != null &&
        _categoria != null) {
      final formattedDate = DateFormat('yyy-MM-dd').format(_selectedDate);
      final formattedTime = _selectedTime!.format(context);
      final fechaInicio = DateTime(_selectedDate!.year, _selectedDate!.month,
          _selectedDate!.day, _selectedTime!.hour, _selectedTime!.minute);
      final fechaFin = fechaInicio.add(Duration(hours: 1));

      final response = await Supabase.instance.client.from('reservas').insert({
        'aula': _aula,
        'categoria': _categoria,
        'descripcion': _descripcion,
        'status': 'pendiente',
        'fecha_inicio': fechaInicio.toIso8601String(),
        'fecha_fin': fechaFin.toIso8601String(),
      }).execute();

      if (response.error == null) {
        print("Reserva guardada exitosamente.");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Review()),
        );
      } else {
        print("Error al guardar la reserva :${response.error!.message} ");
      }
    } else {
      _showErrorDialog(context);
    }
  }
}

@override
Widget build(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  var screenWidth = screenSize.width;

  String formattedDate = _selectedDate != null
      ? DateFormat('dd-MM-yyyy').format(_selectedDate!)
      : '';
  String formattedTime =
      _selectedTime != null ? _selectedTime!.format(context) : '';

  return Center(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Selecciona el día y la hora para reservar tu salón',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            CustomButton(
              width: screenWidth * 0.85,
              height: screenWidth * 0.14,
              onPressed: () => _selectDate(context),
              label: 'Día',
            ),
            SizedBox(height: 20),
            CustomButton(
              width: screenWidth * 0.85,
              height: screenWidth * 0.14,
              onPressed: () => _selectTime(context),
              label: 'Hora',
            ),
            SizedBox(height: 30),
            if (_selectedDate != null)
              Text(
                "Día Reservado: $formattedDate",
                style: TextStyle(fontSize: 18),
              ),
            if (_selectedTime != null)
              Text(
                "Hora Reservada: $formattedTime",
                style: TextStyle(fontSize: 18),
              ),
            SizedBox(height: 20),
            CustomButton(
              width: screenWidth * 0.85,
              height: screenWidth * 0.14,
              onPressed: _guardarReserva(),
              label: 'Siguiente',
            ),
          ],
        ),
      ),
    ),
  );
}
