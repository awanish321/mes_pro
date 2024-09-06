import 'package:flutter/material.dart';


class MeterVisualInspection extends StatefulWidget {
  const MeterVisualInspection({super.key});

  @override
  State<MeterVisualInspection> createState() => _MeterVisualInspectionState();
}

class _MeterVisualInspectionState extends State<MeterVisualInspection> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back, color: Colors.black,),
        ),
        title: const Text("Meter Visual Inspection", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child:ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.green.shade300,
            side: const BorderSide(color: Colors.green, width: 3)
          ),
          child: const Text("Go", style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}
