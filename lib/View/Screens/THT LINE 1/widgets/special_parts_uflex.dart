import 'package:flutter/material.dart';


class SpecialPartsUflexScreen extends StatefulWidget {
  const SpecialPartsUflexScreen({super.key});

  @override
  State<SpecialPartsUflexScreen> createState() => _SpecialPartsUflexScreenState();
}

class _SpecialPartsUflexScreenState extends State<SpecialPartsUflexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        title: const Text("Special Parts UFLEX", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
