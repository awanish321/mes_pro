import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/Final%20Assembly%20Line/widgets/relay_assembly.dart';
import 'package:mes_pro/View/Screens/Final%20Packing%20Line/widgets/laser_marking.dart';

import 'laser_marking.dart';

class PcbLoadScreen extends StatefulWidget {
  const PcbLoadScreen({super.key});

  @override
  State<PcbLoadScreen> createState() => _PcbLoadScreenState();
}

class _PcbLoadScreenState extends State<PcbLoadScreen> {
  // Map to store the table values
  final Map<String, String> tableValues = {
    "Total PCB Load": "100",
    "Process Complete": "48",
    "In Process": "52",
    "Job ID": "105",
    "Attendant ID": "12 TO 14 Digit",
    "Time Cycle": "25 Sec",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange.shade900,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text('PCB Load', style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(),
                1: FlexColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: tableValues.entries.map((entry) {
                return TableRow(
                  children: [
                    TableCell(child: _TableCellContent(text: entry.key)),
                    TableCell(child: _TableCellContent(text: entry.value)),
                  ],
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the next screen and pass the tableValues map
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LaserMarkingScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.lightGreen.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.green.shade900, width: 3),
                ),
              ),
              child: const Text(
                "Go",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TableCellContent extends StatelessWidget {
  final String text;

  const _TableCellContent({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

