import 'package:flutter/material.dart';

class RescheduleOrdersWidget extends StatefulWidget {
  const RescheduleOrdersWidget({super.key});

  @override
  State<RescheduleOrdersWidget> createState() => _RescheduleOrdersWidgetState();
}

class _RescheduleOrdersWidgetState extends State<RescheduleOrdersWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        title: const Text("Reschedule Orders", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.green.shade300,
            side: const BorderSide(color: Colors.green, width: 3)
          ),
          child: const Text("Go", style: TextStyle(color: Colors.black),),
        ),
      )
    );
  }
}
