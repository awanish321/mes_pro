import 'package:flutter/material.dart';



class DePanelGam330AtAndPcbUnloadScreen extends StatefulWidget {
  const DePanelGam330AtAndPcbUnloadScreen({super.key});

  @override
  State<DePanelGam330AtAndPcbUnloadScreen> createState() => _DePanelGam330AtAndPcbUnloadScreenState();
}

class _DePanelGam330AtAndPcbUnloadScreenState extends State<DePanelGam330AtAndPcbUnloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("De Panel GAM330 AT & PCB Unload", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
