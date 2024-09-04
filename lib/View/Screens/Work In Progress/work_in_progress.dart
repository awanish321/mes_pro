import 'package:flutter/material.dart';

class WIP extends StatefulWidget {
  const WIP({super.key});

  @override
  State<WIP> createState() => _WIPState();
}

class _WIPState extends State<WIP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        backgroundColor: Colors.brown.shade500,
        title: const Text("Work In Progress", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
