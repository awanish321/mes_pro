import 'package:flutter/material.dart';


class AOIMV6Screen extends StatefulWidget {
  const AOIMV6Screen({super.key});

  @override
  State<AOIMV6Screen> createState() => _AOIMV6ScreenState();
}

class _AOIMV6ScreenState extends State<AOIMV6Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("AOIMV6", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
