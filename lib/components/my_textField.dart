import 'package:flutter/material.dart';

class MyTextfield extends StatefulWidget {
  String label;
  TextEditingController controller;
  TextInputType type;
  MyTextfield({super.key, required this.label, required this.controller,required this.type});

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.type,
        decoration: InputDecoration(
            label: Text('${widget.label}'),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
