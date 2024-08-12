import 'package:flutter/material.dart';


class SpecialPartsUflexScreen extends StatefulWidget {
  const SpecialPartsUflexScreen({super.key});

  @override
  State<SpecialPartsUflexScreen> createState() => _SpecialPartsUflexScreenState();
}

class _SpecialPartsUflexScreenState extends State<SpecialPartsUflexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text("Special Parts UFLEX"),
      ),
    );
  }
}
