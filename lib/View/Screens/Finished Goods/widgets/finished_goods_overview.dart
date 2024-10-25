import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/Finished%20Goods/finished_goods.dart';

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
        backgroundColor: Colors.indigoAccent.shade700,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Finished Goods Overview", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FinishedGoods())),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.green.shade300,
            side: BorderSide(color: Colors.green.shade900, width: 3),
          ),
          child: const Text("Go", style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}
