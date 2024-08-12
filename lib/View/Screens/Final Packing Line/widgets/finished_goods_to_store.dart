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
        title: const Text("Finished Goods To Store"),
      ),
    );
  }
}
