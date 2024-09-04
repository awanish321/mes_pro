import 'package:flutter/material.dart';

class ETBCFixing extends StatefulWidget {
  const ETBCFixing({super.key});

  @override
  State<ETBCFixing> createState() => _ETBCFixingState();
}

class _ETBCFixingState extends State<ETBCFixing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("ETBC Fixing", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
