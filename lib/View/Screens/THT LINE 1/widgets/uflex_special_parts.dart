import 'package:flutter/material.dart';

class UflexSpecialParts extends StatefulWidget {
  const UflexSpecialParts({super.key});

  @override
  State<UflexSpecialParts> createState() => _UflexSpecialPartsState();
}

class _UflexSpecialPartsState extends State<UflexSpecialParts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text("UFLEX Special Parts"),
      ),
    );
  }
}
