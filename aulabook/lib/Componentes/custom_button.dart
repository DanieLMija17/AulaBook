// custom_button.dart
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;
  final String label;

  const CustomButton({
    required this.width,
    required this.height,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFD8204),
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: height * 0.32), // Adjusted to be relative to the height
            elevation: 4,
            shadowColor: Color(0x3D0038FF),
          ),
          child: Text(label),
        ),
      ),
    );
  }
}
