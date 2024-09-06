import 'package:flutter/material.dart';

class FinishedGoodsStore1 extends StatefulWidget {
  const FinishedGoodsStore1({super.key});

  @override
  State<FinishedGoodsStore1> createState() => _FinishedGoodsStore1State();
}

class _FinishedGoodsStore1State extends State<FinishedGoodsStore1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        elevation: 0,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Finished Goods Store-1", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
