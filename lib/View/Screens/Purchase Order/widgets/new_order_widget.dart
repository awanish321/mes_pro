import 'package:flutter/material.dart';

class NewOrderWidget extends StatefulWidget {
  const NewOrderWidget({super.key});

  @override
  State<NewOrderWidget> createState() => _NewOrderWidgetState();
}

class _NewOrderWidgetState extends State<NewOrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.greenAccent,
        title: const Text("New Order"),
      ),
    );
  }
}
