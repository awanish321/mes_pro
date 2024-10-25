import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/Final%20Packing%20Line/final_packing_line.dart';

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
        backgroundColor: Colors.cyan.shade900,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Finished Goods To Store", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FinalPackingLineScreen())),
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
