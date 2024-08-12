import 'package:flutter/material.dart';


class PCBALoadScreen extends StatefulWidget {
  const PCBALoadScreen({super.key});

  @override
  State<PCBALoadScreen> createState() => _PCBALoadScreenState();
}

class _PCBALoadScreenState extends State<PCBALoadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text("PCBA LOAD"),
      ),
    );
  }
}
