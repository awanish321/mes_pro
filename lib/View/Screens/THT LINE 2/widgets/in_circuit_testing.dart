import 'package:flutter/material.dart';


class InCircuitTestingScreen extends StatefulWidget {
  const InCircuitTestingScreen({super.key});

  @override
  State<InCircuitTestingScreen> createState() => _InCircuitTestingScreenState();
}

class _InCircuitTestingScreenState extends State<InCircuitTestingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: const Text("In Circuit Testing"),
      ),
    );
  }
}
