import 'package:flutter/material.dart';


class PCBACleaning extends StatefulWidget {
  const PCBACleaning({super.key});

  @override
  State<PCBACleaning> createState() => _PCBACleaningState();
}

class _PCBACleaningState extends State<PCBACleaning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("PCBA Cleaning", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
