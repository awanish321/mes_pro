import 'package:flutter/material.dart';

class LaserMarking extends StatefulWidget {
  const LaserMarking({super.key});

  @override
  State<LaserMarking> createState() => _LaserMarkingState();
}

class _LaserMarkingState extends State<LaserMarking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Laser Marking", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
