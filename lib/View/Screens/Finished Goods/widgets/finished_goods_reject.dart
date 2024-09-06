import 'package:flutter/material.dart';

class FinishedGoodsReject extends StatefulWidget {
  const FinishedGoodsReject({super.key});

  @override
  State<FinishedGoodsReject> createState() => _FinishedGoodsRejectState();
}

class _FinishedGoodsRejectState extends State<FinishedGoodsReject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigoAccent,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Finished Goods Reject", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
