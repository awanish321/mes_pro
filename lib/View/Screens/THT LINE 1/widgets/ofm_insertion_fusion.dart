import 'package:flutter/material.dart';


class OFMInsertionFusionScreen extends StatefulWidget {
  const OFMInsertionFusionScreen({super.key});

  @override
  State<OFMInsertionFusionScreen> createState() => _OFMInsertionFusionScreenState();
}

class _OFMInsertionFusionScreenState extends State<OFMInsertionFusionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        title: const Text("OFM Insertion Fusion", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
