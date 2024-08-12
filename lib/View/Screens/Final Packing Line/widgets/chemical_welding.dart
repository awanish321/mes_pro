import 'package:flutter/material.dart';

class ChemicalWelding extends StatefulWidget {
  const ChemicalWelding({super.key});

  @override
  State<ChemicalWelding> createState() => _ChemicalWeldingState();
}

class _ChemicalWeldingState extends State<ChemicalWelding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
        title: const Text("Chemical Welding"),
      ),
    );
  }
}
