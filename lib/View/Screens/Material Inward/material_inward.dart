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
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        title: const Text("Material Inward", style: TextStyle(color: Colors.black),),
      ),
      body: const Center(
        child: Text("Material Inward"),
      ),
    );
  }
}
