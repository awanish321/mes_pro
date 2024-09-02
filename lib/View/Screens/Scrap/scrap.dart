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
        backgroundColor: Colors.green,
        title: const Text("Scrap"),
      ),
    );
  }
}
