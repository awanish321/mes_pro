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
        title: const Text("Asset Prepack"),
      ),
    );
  }
}
