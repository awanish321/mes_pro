import 'package:flutter/material.dart';

class FinishedGoodsToFloor extends StatefulWidget {
  const FinishedGoodsToFloor({super.key});

  @override
  State<FinishedGoodsToFloor> createState() => _FinishedGoodsToFloorState();
}

class _FinishedGoodsToFloorState extends State<FinishedGoodsToFloor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigoAccent,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        title: const Text("Finished Goods on Floor", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
