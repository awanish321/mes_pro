// import 'package:flutter/material.dart';
//
// class WaveSolderPowerFlow extends StatefulWidget {
//   const WaveSolderPowerFlow({super.key});
//
//   @override
//   State<WaveSolderPowerFlow> createState() => _WaveSolderPowerFlowState();
// }
//
// class _WaveSolderPowerFlowState extends State<WaveSolderPowerFlow> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.teal,
//         leading: IconButton(onPressed: (){
//           Navigator.pop(context);
//         }, icon: const Icon(Icons.arrow_back, color: Colors.black,),),
//         title: const Text("Wave Solder Power Flow", style: TextStyle(color: Colors.black),),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/THT%20LINE%201/tht_line_1.dart';

class WaveSolderPowerFlow extends StatefulWidget {
  const WaveSolderPowerFlow({super.key});

  @override
  State<WaveSolderPowerFlow> createState() => _WaveSolderPowerFlowState();
}

class _WaveSolderPowerFlowState extends State<WaveSolderPowerFlow> {
  // Map to store the table values
  final Map<String, String> tableValues = {
    "Process Complete": "48",
    "In Process": "52",
    "Time Cycle": "25 Sec",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text('Wave Solder Power Flow', style: TextStyle(color: Colors.black),),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const THTLine1(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.lightGreen.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Colors.green, width: 3),
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

