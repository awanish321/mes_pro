import 'package:flutter/material.dart';

class FinishedGoodsToStore extends StatefulWidget {
  const FinishedGoodsToStore({super.key});

  @override
  State<FinishedGoodsToStore> createState() => _FinishedGoodsToStoreState();
}

class _FinishedGoodsToStoreState extends State<FinishedGoodsToStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Finished Goods To Store", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
