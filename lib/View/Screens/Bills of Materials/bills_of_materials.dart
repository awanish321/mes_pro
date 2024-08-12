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
        title: const Text("Bills of Materials"),
      ),
      body: const Center(
        child: Text("Bills of Materials"),
      ),
    );
  }
}
