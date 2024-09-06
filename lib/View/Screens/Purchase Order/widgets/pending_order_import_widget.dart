// import 'package:flutter/material.dart';
//
// class PendingOrderImportWidget extends StatefulWidget {
//   const PendingOrderImportWidget({super.key});
//
//   @override
//   State<PendingOrderImportWidget> createState() => _PendingOrderImportWidgetState();
// }
//
// class _PendingOrderImportWidgetState extends State<PendingOrderImportWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.greenAccent,
//         leading: IconButton(onPressed: (){
//           Navigator.pop(context);
//         }, icon: const Icon(Icons.arrow_back, color: Colors.black,),),
//         title: const Text("Pending Order Import", style: TextStyle(color: Colors.black),),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

class PendingOrderImportWidget extends StatefulWidget {
  const PendingOrderImportWidget({super.key});

  @override
  State<PendingOrderImportWidget> createState() => _PendingOrderImportWidgetState();
}

class _PendingOrderImportWidgetState extends State<PendingOrderImportWidget> {
  // Map to store the table values
  final Map<String, String> tableValues = {
    "Customer Name": "Awanish",
    "Delivery Date": "9 September 2024",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.greenAccent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text('Pending Order Import', style: TextStyle(color: Colors.black),),
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

          // GO BUTTON
          /*
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RadialInsertionScreen(),
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
          */
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


