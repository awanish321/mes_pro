import 'package:flutter/material.dart';

class R10Nic extends StatefulWidget{
  const R10Nic({super.key});
  
  @override
  State<R10Nic> createState() => _R10NicState();
}

class _R10NicState extends State<R10Nic>{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lime,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        title: const Text("R10 NIC", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}