import 'package:flutter/material.dart';

class PendingOrderLocalWidget extends StatefulWidget {
  const PendingOrderLocalWidget({super.key});

  @override
  State<PendingOrderLocalWidget> createState() => _PendingOrderLocalWidgetState();
}

class _PendingOrderLocalWidgetState extends State<PendingOrderLocalWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.greenAccent,
        leading: IconButton(onPressed : (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        title: const Text("Pending Order Local", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
