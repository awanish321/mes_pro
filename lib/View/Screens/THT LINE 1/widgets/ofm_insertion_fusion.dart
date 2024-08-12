import 'package:flutter/material.dart';


class OFMInsertionFusionScreen extends StatefulWidget {
  const OFMInsertionFusionScreen({super.key});

  @override
  State<OFMInsertionFusionScreen> createState() => _OFMInsertionFusionScreenState();
}

class _OFMInsertionFusionScreenState extends State<OFMInsertionFusionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text("OFM Insertion Fusion"),
      ),
    );
  }
}
