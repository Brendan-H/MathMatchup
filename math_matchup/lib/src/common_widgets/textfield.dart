import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class TextFieldWidget extends StatelessWidget {
  final String label;

  const TextFieldWidget({required this.label});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}