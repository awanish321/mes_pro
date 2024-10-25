import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/Final%20Packing%20Line/widgets/outer_box_packing.dart';

class InnerBoxPacking extends StatefulWidget {
  const InnerBoxPacking({super.key});

  @override
  State<InnerBoxPacking> createState() => _InnerBoxPackingState();
}

class _InnerBoxPackingState extends State<InnerBoxPacking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan.shade900,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Inner Box Packing", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const OuterBoxPacking())),
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
