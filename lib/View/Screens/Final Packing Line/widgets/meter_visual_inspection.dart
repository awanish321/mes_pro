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
        title: const Text("Meter Visual Inspection"),
      ),
    );
  }
}
