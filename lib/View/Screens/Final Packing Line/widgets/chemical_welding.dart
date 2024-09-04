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
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Chemical Welding", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
