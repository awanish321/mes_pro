import 'package:flutter/material.dart';

class RadialInsertionScreen extends StatefulWidget {
  const RadialInsertionScreen({super.key});

  @override
  State<RadialInsertionScreen> createState() => _RadialInsertionScreenState();
}

class _RadialInsertionScreenState extends State<RadialInsertionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text("RADIAL INSERTION"),
      ),
    );
  }
}
