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
        title: const Text("Inner Box Packing"),
      ),
    );
  }
}
