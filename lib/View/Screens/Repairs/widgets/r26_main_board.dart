import 'package:flutter/material.dart';

class R26MainBoard extends StatefulWidget {
  const R26MainBoard({super.key});
  
  @override
  State<R26MainBoard> createState() => _R26MainBoardState();
}

class _R26MainBoardState extends State<R26MainBoard>{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lime,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        title: const Text("R26 Main Board", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}