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
    );
  }
}
