import 'package:flutter/material.dart';

class OrderInProductionWidget extends StatefulWidget {
  const OrderInProductionWidget({super.key});

  @override
  State<OrderInProductionWidget> createState() => _OrderInProductionWidgetState();
}

class _OrderInProductionWidgetState extends State<OrderInProductionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        title: const Text("Order In Production", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            side: const BorderSide(color: Colors.green, width: 3),
            backgroundColor: Colors.green.shade300
          ),
          child: const Text("Go", style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}
