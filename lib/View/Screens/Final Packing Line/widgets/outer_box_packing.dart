import 'package:flutter/material.dart';

class OuterBoxPacking extends StatefulWidget {
  const OuterBoxPacking({super.key});

  @override
  State<OuterBoxPacking> createState() => _OuterBoxPackingState();
}

class _OuterBoxPackingState extends State<OuterBoxPacking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
        title: const Text("Outer Box Packing"),
      ),
    );
  }
}
