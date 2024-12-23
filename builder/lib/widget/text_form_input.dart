import 'package:flutter/material.dart';

class TextFormInput extends StatelessWidget {
  const TextFormInput(
      {super.key,
      required this.label,
      required this.lenght,
      this.hint,
      required this.validate,
      required this.save,
      required this.inputValue});
  final String inputValue;
  final String label;
  final int lenght;
  final String? hint;
  final String? Function(String?) validate;
  final void Function(String?) save;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: inputValue,
      maxLength: lenght,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      validator: validate,
      onSaved: save,
    );
  }
}
