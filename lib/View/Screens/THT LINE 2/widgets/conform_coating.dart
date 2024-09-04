import 'package:flutter/material.dart';


class ConformCoatingScreen extends StatefulWidget {
  const ConformCoatingScreen({super.key});

  @override
  State<ConformCoatingScreen> createState() => _ConformCoatingScreenState();
}

class _ConformCoatingScreenState extends State<ConformCoatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Conform Coating", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
