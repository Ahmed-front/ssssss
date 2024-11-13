import 'package:flutter/material.dart';
class CustomFormfield extends StatelessWidget {
  final label;
  Icon icon;
  TextEditingController textController = TextEditingController();
  CustomFormfield({super.key, this.label, required this.textController, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "fill data";
        } else {
          textController.text = value;
          return null;
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text(label),
        suffixIcon: icon,
      ),
    );
  }
}
