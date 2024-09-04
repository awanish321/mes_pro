import 'package:flutter/material.dart';

class PendingOrderImportWidget extends StatefulWidget {
  const PendingOrderImportWidget({super.key});

  @override
  State<PendingOrderImportWidget> createState() => _PendingOrderImportWidgetState();
}

class _PendingOrderImportWidgetState extends State<PendingOrderImportWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.greenAccent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        title: const Text("Pending Order Import", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
