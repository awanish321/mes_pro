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
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color:Colors.black)),
        title: const Text("KIOSK", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
