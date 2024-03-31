import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  final String name;

  const TextInputField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.label,
      required this.name});

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        validator: (val) {
          if (val!.isEmpty) {
            return "${widget.name} is required";
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            widget.controller.text = value;
          });
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              gapPadding: 11.5,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          hintText: widget.hint,
          labelText: widget.label,
        ),
      ),
    );
  }
}
