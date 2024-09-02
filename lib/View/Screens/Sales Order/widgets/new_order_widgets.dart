import 'package:flutter/material.dart';

class NewOrdersWidgets extends StatefulWidget {
  const NewOrdersWidgets({super.key});

  @override
  State<NewOrdersWidgets> createState() => _NewOrdersWidgetsState();
}

class _NewOrdersWidgetsState extends State<NewOrdersWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        title: const Text("New Orders"),
      ),
    );
  }
}
