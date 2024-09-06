import 'package:flutter/material.dart';

class FinishedGoodsStore2 extends StatefulWidget {
  const FinishedGoodsStore2({super.key});

  @override
  State<FinishedGoodsStore2> createState() => _FinishedGoodsStore2State();
}

class _FinishedGoodsStore2State extends State<FinishedGoodsStore2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigoAccent,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Finished Goods Store-2", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
