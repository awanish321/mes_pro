import 'package:flutter/material.dart';

class BellyMeter extends StatefulWidget {
  const BellyMeter({super.key});

  @override
  State<BellyMeter> createState() => _BellyMeterState();
}

class _BellyMeterState extends State<BellyMeter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lime,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        title: const Text("Belly Meter", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
