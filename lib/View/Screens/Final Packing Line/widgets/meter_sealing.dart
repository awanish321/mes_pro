import 'package:flutter/material.dart';

class MeterSealing extends StatefulWidget {
  const MeterSealing({super.key});

  @override
  State<MeterSealing> createState() => _MeterSealingState();
}

class _MeterSealingState extends State<MeterSealing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        title: const Text("Meter Sealing", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
