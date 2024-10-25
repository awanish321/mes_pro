import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/Final%20Packing%20Line/widgets/etbc_fixing.dart';

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
        backgroundColor: Colors.cyan.shade900,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Chemical Welding", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ETBCFixing())),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.green.shade300,
            side: BorderSide(color: Colors.green.shade900, width: 3)
          ),
          child: const Text("Go", style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}
