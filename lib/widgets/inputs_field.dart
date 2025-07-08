import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final bool hiddenText;
  final String label;
  final String? errorText;
  final TextEditingController controller;
  const InputField ({
    super.key,
    required this.hintText,
    required this. hiddenText,
    required this.controller,
    required this.label,
    this.errorText,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.normal
          ), 
        ),
        const SizedBox(height: 8),
        TextField(
        obscureText:  hiddenText,
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter your $label',
          filled: true,
          fillColor: Colors.grey[300],
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          errorText: errorText,
        )
      ),
      ]
    );
        
  }
}