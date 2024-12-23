import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      required this.label,
      required this.lenght,
      required this.controller,
      this.hint,
      required this.validate});
  final TextEditingController controller;
  final String label;
  final int lenght;
  final String? hint;
  final String? Function(String?) validate;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: lenght,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      validator: validate,
    );
  }
}
