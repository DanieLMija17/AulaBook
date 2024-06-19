import 'package:flutter/material.dart';
import 'package:aulabook/Componentes/custom_button.dart';
import 'package:intl/intl.dart';
import 'package:aulabook/Feedback/Review.dart';

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
      home: DateTimePickerScreen(),
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
          content: Text("Debes seleccionar una fecha y una hora antes de continuar."),
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

    String formattedDate = _selectedDate != null
        ? DateFormat('dd-MM-yyyy').format(_selectedDate!)
        : '';
    String formattedTime = _selectedTime != null
        ? _selectedTime!.format(context)
        : '';

    return Scaffold(
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
                  Navigator.pop(context); // This will navigate back to the previous screen
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Selecciona el dia y la hora para reservar tu salon',
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
                label: 'Dia',
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
                  "Dia Reservado: $formattedDate",
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
                onPressed: () {
                  if (_selectedDate == null || _selectedTime == null) {
                    _showErrorDialog(context);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Review()),
                    );
                  }
                },
                label: 'Siguiente',
              ),
            ],
          ),
        ),
      ),
    );
  }
}





