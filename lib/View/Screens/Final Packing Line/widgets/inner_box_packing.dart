import 'package:flutter/material.dart';

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
        backgroundColor: Colors.cyan,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Inner Box Packing", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
