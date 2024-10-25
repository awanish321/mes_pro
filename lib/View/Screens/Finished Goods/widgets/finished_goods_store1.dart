import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/Finished%20Goods/widgets/finished_goods_store2.dart';

class FinishedGoodsStore1 extends StatefulWidget {
  const FinishedGoodsStore1({super.key});

  @override
  State<FinishedGoodsStore1> createState() => _FinishedGoodsStore1State();
}

class _FinishedGoodsStore1State extends State<FinishedGoodsStore1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent.shade700,
        elevation: 0,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Finished Goods Store-1", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FinishedGoodsStore2())),
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
