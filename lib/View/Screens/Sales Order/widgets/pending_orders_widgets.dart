import 'package:flutter/material.dart';

class PendingOrdersWidgets extends StatefulWidget {
  const PendingOrdersWidgets({super.key});

  @override
  State<PendingOrdersWidgets> createState() => _PendingOrdersWidgetsState();
}

class _PendingOrdersWidgetsState extends State<PendingOrdersWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        title: const Text("Pending Orders"),
      ),
    );
  }
}
