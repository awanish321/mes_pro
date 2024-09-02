// import 'package:flutter/material.dart';
//
// class TerminalBlockAssembly extends StatefulWidget {
//   const TerminalBlockAssembly({super.key});
//
//   @override
//   State<TerminalBlockAssembly> createState() => _TerminalBlockAssemblyState();
// }
//
// class _TerminalBlockAssemblyState extends State<TerminalBlockAssembly> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.pink,
//         title: const Text('Terminal Block Assembly'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Table(
//               border: TableBorder.all(),
//               columnWidths: const <int, TableColumnWidth>{
//                 0: FlexColumnWidth(),
//                 1: FlexColumnWidth(),
//               },
//               defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//               children: const [
//                 TableRow(
//                   children: [
//                     TableCell(child: _TableCellContent(text: "Total PCB Load")),
//                     TableCell(child: _TableCellContent(text: "100")),
//                   ],
//                 ),
//                 TableRow(
//                   children: [
//                     TableCell(child: _TableCellContent(text: "Process Complete")),
//                     TableCell(child: _TableCellContent(text: "48")),
//                   ],
//                 ),
//                 TableRow(
//                   children: [
//                     TableCell(child: _TableCellContent(text: "In Process")),
//                     TableCell(child: _TableCellContent(text: "52")),
//                   ],
//                 ),
//                 TableRow(
//                   children: [
//                     TableCell(child: _TableCellContent(text: "Job ID")),
//                     TableCell(child: _TableCellContent(text: "105")),
//                   ],
//                 ),
//                 TableRow(
//                   children: [
//                     TableCell(child: _TableCellContent(text: "Attendent ID")),
//                     TableCell(child: _TableCellContent(text: "12 TO 14 Digit")),
//                   ],
//                 ),
//                 TableRow(
//                   children: [
//                     TableCell(child: _TableCellContent(text: "Time Cycle")),
//                     TableCell(child: _TableCellContent(text: "25 Sec")),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//
//           Padding(
//               padding: const EdgeInsets.all(16),
//             child: ElevatedButton(
//                 onPressed: (){},
//                 style: ElevatedButton.styleFrom(
//                   elevation: 0,
//                   backgroundColor: Colors.lightGreen.shade300,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     side: const BorderSide(color: Colors.green,  width: 3)
//                   )
//                 ),
//                 child: const Text("Go", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),)
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class _TableCellContent extends StatelessWidget {
//   final String text;
//
//   const _TableCellContent({required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Center(
//         child: Text(
//           text,
//           style: Theme.of(context).textTheme.bodyMedium,
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/Final%20Assembly%20Line/widgets/relay_assembly.dart';

class TerminalBlockAssembly extends StatefulWidget {
  const TerminalBlockAssembly({super.key});

  @override
  State<TerminalBlockAssembly> createState() => _TerminalBlockAssemblyState();
}

class _TerminalBlockAssemblyState extends State<TerminalBlockAssembly> {
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
        backgroundColor: Colors.pink,
        title: const Text('Terminal Block Assembly'),
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
                    builder: (context) => RelayAssembly(tableValues: tableValues),
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

