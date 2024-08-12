import 'package:flutter/material.dart';


class MaterialInwardScreen extends StatefulWidget {
  const MaterialInwardScreen({super.key});

  @override
  State<MaterialInwardScreen> createState() => _MaterialInwardScreenState();
}

class _MaterialInwardScreenState extends State<MaterialInwardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: const Text("Material Inward"),
      ),
      body: const Center(
        child: Text("Material Inward"),
      ),
    );
  }
}
