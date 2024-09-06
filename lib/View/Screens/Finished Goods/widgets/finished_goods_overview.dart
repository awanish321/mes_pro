import 'package:flutter/material.dart';

class FinishedGoodsOverview extends StatefulWidget {
  const FinishedGoodsOverview({super.key});

  @override
  State<FinishedGoodsOverview> createState() => _FinishedGoodsOverviewState();
}

class _FinishedGoodsOverviewState extends State<FinishedGoodsOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigoAccent,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Finished Goods Overview", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
