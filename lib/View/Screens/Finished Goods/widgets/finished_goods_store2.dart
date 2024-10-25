import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/Finished%20Goods/widgets/finished_goods_to_floor.dart';

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
        backgroundColor: Colors.indigoAccent.shade700,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Finished Goods Store-2", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FinishedGoodsToFloor())),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.green.shade300,
            side: BorderSide(
              color: Colors.green.shade900,
              width: 3
            )
          ),
          child: const Text("Go", style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}
