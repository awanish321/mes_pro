import 'package:flutter/material.dart';

class KIOSK extends StatefulWidget {
  const KIOSK({super.key});

  @override
  State<KIOSK> createState() => _KIOSKState();
}

class _KIOSKState extends State<KIOSK> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
        title: const Text("KIOSK"),
      ),
    );
  }
}
