import 'package:flutter/material.dart';


class BillsOfMaterialsScreen extends StatefulWidget {
  const BillsOfMaterialsScreen({super.key});

  @override
  State<BillsOfMaterialsScreen> createState() => _BillsOfMaterialsScreenState();
}

class _BillsOfMaterialsScreenState extends State<BillsOfMaterialsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Bills of Materials", style: TextStyle(color: Colors.black),),
      ),
      body: const Center(
        child: Text("Bills of Materials"),
      ),
    );
  }
}
