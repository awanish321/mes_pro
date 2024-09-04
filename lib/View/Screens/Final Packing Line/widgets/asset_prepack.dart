import 'package:flutter/material.dart';

class AssetPrepack extends StatefulWidget {
  const AssetPrepack({super.key});

  @override
  State<AssetPrepack> createState() => _AssetPrepackState();
}

class _AssetPrepackState extends State<AssetPrepack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Asset Prepack", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
