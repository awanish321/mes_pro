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
        title: const Text("Pending Order Local"),
      ),
    );
  }
}
