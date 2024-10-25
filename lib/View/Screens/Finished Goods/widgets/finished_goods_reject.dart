import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/Finished%20Goods/widgets/finished_goods_overview.dart';

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
        backgroundColor: Colors.indigoAccent.shade700,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Finished Goods Reject", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FinishedGoodsOverview())),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.green.shade300,
            side: BorderSide(color: Colors.green.shade900, width: 3)
          ),
          child: const Text("Go", style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}
