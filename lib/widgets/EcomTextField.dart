import 'package:flutter/material.dart';

class EcomTextField extends StatelessWidget {
  const EcomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.keyboardType,
  });

  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Color.fromARGB(150, 0, 0, 0),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
