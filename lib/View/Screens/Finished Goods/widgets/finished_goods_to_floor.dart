import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/Finished%20Goods/widgets/finished_goods_reject.dart';

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
        backgroundColor: Colors.indigoAccent.shade700,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        title: const Text("Finished Goods on Floor", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FinishedGoodsReject())),
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
