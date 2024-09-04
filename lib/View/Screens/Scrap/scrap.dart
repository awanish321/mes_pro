import 'package:flutter/material.dart';

class Scrap extends StatefulWidget {
  const Scrap({super.key});

  @override
  State<Scrap> createState() => _ScrapState();
}

class _ScrapState extends State<Scrap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        backgroundColor: Colors.green,
        title: const Text("Scrap", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
