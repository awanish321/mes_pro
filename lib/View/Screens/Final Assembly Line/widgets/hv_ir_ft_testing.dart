// import 'package:flutter/material.dart';
//
// class HvIrFtTesting extends StatefulWidget {
//   const HvIrFtTesting({super.key});
//
//   @override
//   State<HvIrFtTesting> createState() => _HvIrFtTestingState();
// }
//
// class _HvIrFtTestingState extends State<HvIrFtTesting> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.pink,
//         title: const Text('HV, IR, FT Testing'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Table(
//           border: TableBorder.all(),
//           columnWidths: const <int, TableColumnWidth>{
//             0: FlexColumnWidth(),
//             1: FlexColumnWidth(),
//           },
//           defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//           children: const [
//             TableRow(
//               children: [
//                 TableCell(child: _TableCellContent(text: "Total PCB Load")),
//                 TableCell(child: _TableCellContent(text: "100")),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(child: _TableCellContent(text: "Process Complete")),
//                 TableCell(child: _TableCellContent(text: "48")),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(child: _TableCellContent(text: "In Process")),
//                 TableCell(child: _TableCellContent(text: "52")),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(child: _TableCellContent(text: "Job ID")),
//                 TableCell(child: _TableCellContent(text: "105")),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(child: _TableCellContent(text: "Attendent ID")),
//                 TableCell(child: _TableCellContent(text: "12 TO 14 Digit")),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(child: _TableCellContent(text: "Time Cycle")),
//                 TableCell(child: _TableCellContent(text: "25 Sec")),
//               ],
//             ),
//           ],
//         ),
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
import 'package:mes_pro/View/Screens/Final%20Assembly%20Line/widgets/accuracy_and_caliberation.dart';

class HvIrFtTesting extends StatefulWidget {
  final Map<String, String> tableValues;

  const HvIrFtTesting({super.key, required this.tableValues});

  @override
  State<HvIrFtTesting> createState() => _HvIrFtTestingState();
}

class _HvIrFtTestingState extends State<HvIrFtTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink,
        title: const Text('HV, IR, FT Testing'),
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
              children: widget.tableValues.entries.map((entry) {
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
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AccuracyAndCalibration(tableValues: widget.tableValues)));
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.lightGreen.shade300,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.green, width: 3),
                        borderRadius: BorderRadius.circular(8)
                    )
                ),
                child: const Text("Go", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),)
            ),
          )

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
