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
        title: const Text("Pending Order Import"),
      ),
    );
  }
}
